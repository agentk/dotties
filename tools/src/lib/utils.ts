import { execSync } from 'child_process';
import { createHash } from 'crypto';

export function isUrl(input: string): boolean {
  return /^https?:\/\//.test(input);
}

export function generateSlug(input: string): string {
  return input
    .toLowerCase()
    .replace(/^https?:\/\//, '')  // Remove protocol
    .replace(/[^a-z0-9\s/-]/g, '') // Remove non-alphanumeric chars except slashes
    .replace(/\/+/g, '-')         // Replace slashes with hyphens
    .replace(/\s+/g, '-')         // Replace spaces with hyphens
    .replace(/-+/g, '-')          // Replace multiple hyphens with single hyphen
    .replace(/^-|-$/g, '');       // Remove leading/trailing hyphens
}

export function generateHash(input: string): string {
  return createHash('sha1').update(input).digest('hex');
}

export function isAlreadyImported(hash: string, sourcesDir: string): boolean {
  try {
    const result = execSync(`grep -q "${hash}" "${sourcesDir}"/*.md 2>/dev/null || echo "not_found"`, { encoding: 'utf-8' });
    return result.trim() !== 'not_found';
  } catch {
    return false;
  }
} 