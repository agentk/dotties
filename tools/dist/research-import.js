#!/usr/bin/env node
import { writeFileSync } from 'fs';
import { join } from 'path';
import { setupConfig } from './lib/config.js';
import { isUrl, generateSlug, generateHash, isAlreadyImported } from './lib/utils.js';
import { getTitle, getCleanContent, callOpenAI, extractPdfText } from './lib/content.js';
import { generateMarkdown } from './lib/markdown.js';
async function processUrl(url, config) {
    const hash = generateHash(url);
    const title = await getTitle(url);
    const slug = generateSlug(url);
    const outputFile = join(config.sourcesDir, `${slug}.md`);
    if (isAlreadyImported(hash, config.sourcesDir)) {
        console.log(`Already imported: ${url}`);
        return;
    }
    console.log('Parsing web content...');
    const content = await getCleanContent(url);
    console.log('Summarising content...');
    const summary = await callOpenAI(content);
    const markdown = await generateMarkdown(url, hash, content, summary);
    writeFileSync(outputFile, markdown);
    console.log(`Saved to ${outputFile}`);
}
async function processPdf(pdfPath, config) {
    const hash = generateHash(pdfPath);
    const basename = pdfPath.split('/').pop()?.replace(/\.pdf$/, '') || '';
    const slug = generateSlug(basename);
    const outputFile = join(config.sourcesDir, `${slug}.md`);
    if (isAlreadyImported(hash, config.sourcesDir)) {
        console.log(`Already imported: ${pdfPath}`);
        return;
    }
    console.log('Extracting PDF text...');
    const text = extractPdfText(pdfPath);
    console.log('Summarising PDF content...');
    const summary = await callOpenAI(text);
    const markdown = await generateMarkdown(pdfPath, hash, text, summary);
    writeFileSync(outputFile, markdown);
    console.log(`Saved to ${outputFile}`);
}
async function main() {
    const args = process.argv.slice(2);
    if (args.length === 0) {
        console.error('Please provide a URL or PDF file path');
        process.exit(1);
    }
    const input = args[0];
    const config = setupConfig();
    try {
        if (isUrl(input)) {
            await processUrl(input, config);
        }
        else if (input.toLowerCase().endsWith('.pdf')) {
            await processPdf(input, config);
        }
        else {
            console.error('Unsupported input: please provide a URL or PDF');
            process.exit(1);
        }
    }
    catch (error) {
        console.error('Error processing input:', error);
        process.exit(1);
    }
}
main().catch(error => {
    console.error('Fatal error:', error);
    process.exit(1);
});
