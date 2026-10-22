---
name: ask-effort-and-ultracode-per-step
description: "Before each new step, recommend an effort level, a model and whether ultracode is needed, and ask the owner"
metadata:
  node_type: memory
  type: feedback
  originSessionId: e5c7eb01-7b59-4959-8d21-b74bf6870f04
  modified: 2026-10-16T11:32:25.897Z
---

Before starting each new step/task, tell the owner which effort level (low / medium / high / xhigh / max), which model (Haiku / Sonnet / Opus) and whether ultracode (multi-agent workflow) fit it, then ask them to set it. Only I can recommend; the owner changes effort via `/effort`, the model via `/model` and toggles ultracode themselves.

**Why:** Owner said on 2026-10-14: "every time for each step, your task is to ask me which effort to set or whether you need ultracode or not." On 2026-10-16 they asked to add the model to the same question. They want control over cost and depth per task.
**Scope:** This is for the main session talking to the owner only. Subagents and workflow agents must NOT stop to ask; they cannot reach the owner, and on 2026-10-14 a workflow's refine step halted on this rule and the winner was never ported. When writing workflow prompts, state that the owner already approved the settings for the run.
**How to apply:** Ask with AskUserQuestion, recommended option first. Put effort and model in one question when they go together (e.g. "Medium + Sonnet (Recommended)"), and say which `/effort` and `/model` commands to run if they differ from the current ones. If the owner has already set the recommended level and model for the step at hand, proceed without re-asking. Effort guide: low = docs/commits/copy; medium = normal features (FAQ, waitlist form); high = animation craft, layout, hard debugging; xhigh/max = payments, backend design, security. Model guide: Haiku = quick lookups, typos, doc tweaks; Sonnet = normal features, tests, copy, small PR reviews; Opus = payments, auth, security, architecture, tricky bugs, design polish. Ultracode only for wide-solution or high-stakes work (animation design panel, payment/security review), not small edits. Related: [[suggest-clear-after-steps]].
