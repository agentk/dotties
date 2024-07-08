#!/usr/bin/env node
import { writeFileSync, existsSync, mkdirSync } from 'fs';
import { join, dirname } from 'path';
import { getCleanContent } from './lib/content.js';
import { generateSlug } from './lib/utils.js';
async function main() {
    const args = process.argv.slice(2);
    if (args.length === 0) {
        console.error('Usage: node url-to-markdown.js <url> [output-path]');
        console.error('');
        console.error('Examples:');
        console.error('  node url-to-markdown.js https://example.com');
        console.error('  node url-to-markdown.js https://example.com ./output/article.md');
        console.error('  node url-to-markdown.js https://example.com ./articles/');
        process.exit(1);
    }
    const url = args[0];
    let outputPath = args[1];
    // Validate URL
    try {
        new URL(url);
    }
    catch {
        console.error('Invalid URL provided');
        process.exit(1);
    }
    try {
        console.log(`Fetching content from: ${url}`);
        const content = await getCleanContent(url);
        if (!content) {
            console.error('No content could be extracted from the URL');
            process.exit(1);
        }
        // Determine output path
        if (!outputPath) {
            // Default to current directory with slug-based filename
            const slug = generateSlug(url);
            outputPath = `./${slug}.md`;
        }
        else if (outputPath.endsWith('/') || !outputPath.includes('.')) {
            // If it's a directory or doesn't have an extension, create a filename
            const slug = generateSlug(url);
            outputPath = join(outputPath, `${slug}.md`);
        }
        // Ensure output directory exists
        const outputDir = dirname(outputPath);
        if (!existsSync(outputDir)) {
            mkdirSync(outputDir, { recursive: true });
        }
        // Create markdown content with metadata
        const markdown = `---
source: ${url}
collected: ${new Date().toISOString().split('T')[0]}
---

${content}
`;
        writeFileSync(outputPath, markdown);
        console.log(`Markdown saved to: ${outputPath}`);
    }
    catch (error) {
        console.error('Error processing URL:', error);
        process.exit(1);
    }
}
main().catch(error => {
    console.error('Fatal error:', error);
    process.exit(1);
});
