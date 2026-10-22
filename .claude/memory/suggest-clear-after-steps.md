---
name: suggest-clear-after-steps
description: "end each finished, pushed step with a short \"good point to /clear\" line; owner wants to save tokens"
metadata:
  node_type: memory
  type: feedback
  originSessionId: e5c7eb01-7b59-4959-8d21-b74bf6870f04
  modified: 2026-10-21T16:35:16.385Z
---

When a step is finished, committed and pushed, ALWAYS update PROGRESS.md first with what was done, then end the reply with one short line saying it's a good point to `/clear`.

**Why:** the owner wants PROGRESS.md to always reflect the latest state before clearing context. Without this, work done in conversation gets lost from the project record.

**How to apply:** before suggesting /clear — (1) update PROGRESS.md with today's work, (2) commit and push the PROGRESS.md update, (3) then suggest /clear. Never suggest /clear before PROGRESS.md is updated. Related: [[ask-effort-and-ultracode-per-step]].
