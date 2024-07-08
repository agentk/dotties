export async function generateMarkdown(source: string, hash: string, content: string, summary: string): Promise<string> {
  const date = new Date().toISOString().split('T')[0];
  
  return `---
source: ${source}
collected: ${date}
hash: ${hash}
tags: []
---

# Summary

${summary}

---

# Full Content

${content.slice(0, 10000)}
`;
} 