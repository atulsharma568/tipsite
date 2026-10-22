# Global instructions (apply in every session, in any folder)

## Match effort and ultracode to how hard each step is

Before starting each step of a task, judge how hard it is, then ask me to set the effort level and ultracode to match. Wait for my answer before doing the step.

- A step is any distinct piece of work: research, planning, implementing, reviewing, testing, committing. A pure conversational answer that needs no tools is not a step.
- Ask with the AskUserQuestion tool. Say what level the step needs and why in one line, and put that option first, marked "(Recommended)".
- Effort: you cannot change the session's effort yourself. If the step needs a different level from the current one, ask me to switch with `/effort <level>` and wait until I confirm. Rough guide:
  - low: a typo, a rename, a one-line or one-file change, a quick lookup.
  - medium: a normal feature or bug fix touching a few files.
  - high: a change across many files, a tricky bug, design or architecture decisions.
  - xhigh or max: security, payments, data migrations, or anything costly to get wrong.
- Ultracode: also say whether the step needs ultracode (a multi-agent workflow). Recommend it only for broad or high-stakes work, such as a thorough review or audit, research across many sources, or a large migration. For anything small, recommend no. If I say yes, run the step as a workflow; if no, do it without one.
- Use the effort I choose for any subagents or workflow agents you start.
