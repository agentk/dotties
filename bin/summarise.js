#!/usr/bin/env node

const https = require("https");
const { execSync } = require("child_process");
const { readFileSync } = require("fs");

const apiKey = process.env.OPENAI_API_KEY;
const MERCURY_API_KEY = process.env.MERCURY_API_KEY;

if (!apiKey) {
  console.error("Missing OPENAI_API_KEY");
  process.exit(1);
}

if (!MERCURY_API_KEY) {
  console.error("Missing MERCURY_API_KEY");
  process.exit(1);
}

const getTitle = async (url) => {
  return new Promise((resolve) => {
    https
      .get(url, (res) => {
        let html = "";
        res.on("data", (chunk) => (html += chunk));
        res.on("end", () => {
          const match = html.match(/<title>(.*?)<\/title>/i);
          resolve(match ? match[1].replace(/\s+/g, " ").trim() : "Untitled");
        });
      })
      .on("error", () => resolve("Untitled"));
  });
};

const callOpenAI = (prompt) => {
  const payload = {
    model: "gpt-4",
    messages: [
      {
        role: "system",
        content: "Summarise the following content into 3–5 bullet points.",
      },
      { role: "user", content: prompt },
    ],
    temperature: 0.4,
  };

  const response = execSync(`curl https://api.openai.com/v1/chat/completions \
    -s -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${apiKey}" \
    -d '${JSON.stringify(payload)}'`);

  return JSON.parse(response).choices[0].message.content.trim();
};

const getCleanContent = async (url) => {
  return new Promise((resolve) => {
    const options = {
      hostname: 'mercury.postlight.com',
      path: `/parser?url=${encodeURIComponent(url)}`,
      headers: {
        'x-api-key': MERCURY_API_KEY
      }
    };

    https.get(options, (res) => {
      let data = '';
      res.on('data', (chunk) => data += chunk);
      res.on('end', () => {
        try {
          const parsed = JSON.parse(data);
          if (parsed.content) {
            // Convert HTML content to markdown
            const markdown = execSync(`echo '${parsed.content.replace(/'/g, "'\\''")}' | pandoc -f html -t markdown_strict`).toString();
            resolve(markdown);
          } else {
            resolve('');
          }
        } catch (e) {
          resolve('');
        }
      });
    }).on('error', () => resolve(''));
  });
};

(async () => {
  const args = process.argv.slice(2);
  const isStdin = args.includes("--stdin");
  const hash = args[isStdin ? 1 : 2] || "unknown";
  const source = args[isStdin ? 2 : 1] || "unknown";
  let content = "";

  if (args[0] === "--get-title") {
    const title = await getTitle(args[1]);
    console.log(title);
    return;
  }

  if (isStdin) {
    content = readFileSync(0, "utf8");
  } else {
    const url = args[0];
    content = await getCleanContent(url);
  }

  const summary = callOpenAI(content.slice(0, 3000));
  const date = new Date().toISOString().split("T")[0];

  console.log(`---
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
`);
})();
