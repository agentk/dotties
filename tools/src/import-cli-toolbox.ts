#!/usr/bin/env node

import { writeFileSync, existsSync, mkdirSync } from "fs";
import { join } from "path";
import { homedir } from "os";
import { getCleanContent } from "./lib/content.js";
import { generateSlug } from "./lib/utils.js";
import OpenAI from "openai";
import { execSync } from "child_process";

// Initialize OpenAI client
const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

if (!process.env.OPENAI_API_KEY) {
  console.error("Missing OPENAI_API_KEY");
  process.exit(1);
}

async function generateToolSummary(
  content: string,
  tldrContent: string | null,
): Promise<string> {
  const messages: any[] = [
    {
      role: "system",
      content: `Create a concise TLDR summary of this CLI tool. Include:
1. A one-line description
2. Usage examples (extract and combine the most useful examples from both tldr and GitHub content)
3. Key features (3-5 bullet points)
4. Installation (one line each for macOS, Ubuntu, and NixOS if available)

Format the response in markdown. Prioritize the tldr content if provided. Keep installation instructions to a single line per platform.`,
    },
  ];

  if (tldrContent) {
    messages.push({
      role: "user",
      content: `=== TLDR Content ===\n\n${tldrContent}\n\n=== GitHub Content ===\n\n${content.slice(0, 3000)}`,
    });
  } else {
    messages.push({
      role: "user",
      content: content.slice(0, 3000),
    });
  }

  const response = await openai.chat.completions.create({
    model: "gpt-4",
    messages,
    temperature: 0.4,
  });

  return response.choices[0].message.content?.trim() || "";
}

async function getTldrContent(toolName: string): Promise<string | null> {
  try {
    return execSync(`tldr ${toolName} -R`, { encoding: "utf-8" });
  } catch (error) {
    console.warn(`Warning: Could not get tldr content for ${toolName}`);
    return null;
  }
}

async function main() {
  const args = process.argv.slice(2);

  if (args.length < 2) {
    console.error("Usage: node import-cli-toolbox.js <tool-name> <github-url>");
    process.exit(1);
  }

  const toolName = args[0];
  const url = args[1];

  if (!url.includes("github.com")) {
    console.error("Please provide a GitHub URL");
    process.exit(1);
  }

  const toolboxDir = join(homedir(), "notes/02 - Notes/CLI Toolbox");
  if (!existsSync(toolboxDir)) {
    mkdirSync(toolboxDir, { recursive: true });
  }

  try {
    console.log("Getting tldr content...");
    const tldrContent = await getTldrContent(toolName);

    console.log("Parsing GitHub content...");
    const content = await getCleanContent(url);

    console.log("Generating tool summary...");
    const summary = await generateToolSummary(content, tldrContent);

    const slug = generateSlug(toolName);
    const outputFile = join(toolboxDir, `${slug}.md`);

    const markdown = `---
source: ${url}
collected: ${new Date().toISOString().split("T")[0]}
tags: [cli-tool]
---

${summary}
`;

    writeFileSync(outputFile, markdown);
    console.log(`Saved to ${outputFile}`);

    // Format the generated markdown file
    console.log("Formatting markdown file...");
    execSync(`prettier --write "${outputFile}"`, { stdio: "inherit" });
    // execSync(`markdownlint -c '~/notes/.markdownlintrc' --fix "${outputFile}" 2>/dev/null || true`, { stdio: 'inherit' });
  } catch (error) {
    console.error("Error processing input:", error);
    process.exit(1);
  }
}

main().catch((error) => {
  console.error("Fatal error:", error);
  process.exit(1);
});

