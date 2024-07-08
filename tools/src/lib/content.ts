import { execSync } from 'child_process';
import https from 'https';
import Parser from '@postlight/parser';
import OpenAI from 'openai';

export async function getTitle(url: string): Promise<string> {
  return new Promise((resolve) => {
    https
      .get(url, (res) => {
        let html = '';
        res.on('data', (chunk) => (html += chunk));
        res.on('end', () => {
          const match = html.match(/<title>(.*?)<\/title>/i);
          resolve(match ? match[1].replace(/\s+/g, ' ').trim() : 'Untitled');
        });
      })
      .on('error', () => resolve('Untitled'));
  });
}

export async function getCleanContent(url: string): Promise<string> {
  try {
    // Handle GitHub URLs
    if (url.includes('github.com')) {
      // Convert GitHub URL to raw content URL
      const rawUrl = url
        .replace('github.com', 'raw.githubusercontent.com')
        .replace(/\/blob\//, '/')
        .replace(/\/tree\//, '/')
        + '/main/README.md';
      
      return new Promise((resolve, reject) => {
        https.get(rawUrl, (res) => {
          if (res.statusCode === 404) {
            // Try master branch if main doesn't exist
            const masterUrl = rawUrl.replace('/main/', '/master/');
            https.get(masterUrl, (masterRes) => {
              if (masterRes.statusCode === 404) {
                reject(new Error('README.md not found in main or master branch'));
                return;
              }
              let content = '';
              masterRes.on('data', (chunk) => (content += chunk));
              masterRes.on('end', () => resolve(content));
              masterRes.on('error', reject);
            }).on('error', reject);
            return;
          }
          let content = '';
          res.on('data', (chunk) => (content += chunk));
          res.on('end', () => resolve(content));
          res.on('error', reject);
        }).on('error', reject);
      });
    }

    // Fall back to parser for non-GitHub URLs
    const result = await Parser.parse(url, { contentType: 'markdown' });
    return result.content || '';
  } catch (error) {
    console.error('Error parsing URL:', error);
    return '';
  }
}

export async function callOpenAI(content: string): Promise<string> {
  if (!process.env.OPENAI_API_KEY) {
    throw new Error('Missing OPENAI_API_KEY environment variable');
  }

  const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY,
  });

  const response = await openai.chat.completions.create({
    model: 'gpt-4',
    messages: [
      {
        role: 'system',
        content: 'Summarise the following content into 3–5 bullet points.',
      },
      { role: 'user', content: content.slice(0, 3000) },
    ],
    temperature: 0.4,
  });

  return response.choices[0].message.content?.trim() || '';
}

export function extractPdfText(pdfPath: string): string {
  return execSync(`pandoc "${pdfPath}" -t plain`, { encoding: 'utf-8' });
}