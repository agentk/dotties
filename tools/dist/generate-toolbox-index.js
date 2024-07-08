#!/usr/bin/env node
import { readFileSync, readdirSync, writeFileSync, existsSync } from 'fs';
import { join } from 'path';
import { homedir } from 'os';
import OpenAI from 'openai';
// Initialize OpenAI client
const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY,
});
if (!process.env.OPENAI_API_KEY) {
    console.error('Missing OPENAI_API_KEY');
    process.exit(1);
}
function extractToolInfo(content) {
    const sourceMatch = content.match(/source: (.*)/);
    const url = sourceMatch ? sourceMatch[1].trim() : '';
    const name = url.split('/').pop()?.replace(/\.git$/, '') || 'unknown';
    // Extract the first line of the content as description
    const description = content.split('\n').find(line => line.trim() && !line.startsWith('---')) || '';
    return {
        name,
        url,
        description: description.trim(),
        content
    };
}
async function generateSummary(tools, existingSummary) {
    const toolsList = tools.map(tool => ({
        name: tool.name,
        url: tool.url,
        description: tool.description
    }));
    const systemPrompt = `Create a markdown summary of these CLI tools. Include:

1. A brief introduction paragraph
2. A table with columns:
   - Tool Name (as a markdown link to the tool's URL)
   - Description (first line of the tool's description)
   - Category (based on the tool's purpose)
3. A "Categories" section that groups tools by their purpose

Format the response in markdown. Make sure all tool names are markdown links to their respective URLs.`;
    const messages = [
        {
            role: 'system',
            content: systemPrompt,
        }
    ];
    // If there's an existing summary, include it in the prompt
    if (existingSummary) {
        messages.push({
            role: 'system',
            content: `Here is the existing summary that you should use as a reference for style and categories, but update with any new tools:\n\n${existingSummary}`
        });
    }
    messages.push({
        role: 'user',
        content: JSON.stringify(toolsList, null, 2)
    });
    const response = await openai.chat.completions.create({
        model: 'gpt-4',
        messages,
        temperature: 0.4,
    });
    return response.choices[0].message.content?.trim() || '';
}
async function main() {
    const toolboxDir = join(homedir(), 'notes/02 - Notes/CLI Toolbox');
    const outputFile = join(homedir(), 'notes/02 - Notes/CLI Toolbox.md');
    try {
        // Read all markdown files in the toolbox directory
        const files = readdirSync(toolboxDir)
            .filter(file => file.endsWith('.md'))
            .map(file => join(toolboxDir, file));
        // Extract information from each file
        const tools = files.map(file => {
            const content = readFileSync(file, 'utf-8');
            return extractToolInfo(content);
        });
        // Read existing summary if it exists
        let existingSummary;
        if (existsSync(outputFile)) {
            existingSummary = readFileSync(outputFile, 'utf-8');
        }
        console.log('Generating summary...');
        const summary = await generateSummary(tools, existingSummary);
        // Write the summary to the output file
        writeFileSync(outputFile, summary);
        console.log(`Summary written to ${outputFile}`);
    }
    catch (error) {
        console.error('Error generating summary:', error);
        process.exit(1);
    }
}
main().catch(error => {
    console.error('Fatal error:', error);
    process.exit(1);
});
