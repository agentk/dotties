import { existsSync, mkdirSync } from 'fs';
import { homedir } from 'os';
import { join } from 'path';

export interface Config {
  vaultDir: string;
  sourcesDir: string;
  topicsDir: string;
}

export function setupConfig(): Config {
  const vaultDir = join(homedir(), 'notes/03 - Research');
  const sourcesDir = join(vaultDir, 'Sources');
  const topicsDir = join(vaultDir, 'Topics');

  // Create directories if they don't exist
  [vaultDir, sourcesDir, topicsDir].forEach(dir => {
    if (!existsSync(dir)) {
      mkdirSync(dir, { recursive: true });
    }
  });

  return { vaultDir, sourcesDir, topicsDir };
} 