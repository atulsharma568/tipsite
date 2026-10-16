#!/usr/bin/env node
// Stop hook: after each reply, read how much context the chat is using from
// the transcript and, past the limit, tell the owner it's a good time to
// /clear. Local only; it reads the transcript and sends nothing anywhere.
import { readFileSync } from "node:fs";

const LIMIT = 150_000;

let input = "";
for await (const chunk of process.stdin) input += chunk;

try {
  const { transcript_path: path } = JSON.parse(input);
  const lines = readFileSync(path, "utf8").trimEnd().split("\n");
  for (let i = lines.length - 1; i >= 0; i--) {
    const usage = JSON.parse(lines[i])?.message?.usage;
    if (!usage) continue;
    const used =
      (usage.input_tokens ?? 0) +
      (usage.cache_creation_input_tokens ?? 0) +
      (usage.cache_read_input_tokens ?? 0);
    if (used >= LIMIT) {
      const k = Math.round(used / 1000);
      console.log(
        JSON.stringify({
          systemMessage: `Context is at ${k}k tokens. Good time to /clear once this step is committed; progress is saved in PROGRESS.md.`,
        }),
      );
    }
    break;
  }
} catch {
  // Never block or break a session over a warning.
}
