@AGENTS.md

## Working agreement

- Read `PROGRESS.md` first: it has the current state, decisions, open questions and next steps.
- When a change is finished and verified (lint, type check and build pass), update `PROGRESS.md`, then commit and push to `main` without asking. This is the owner's standing instruction for this repo.
- Never force-push and never bypass commit or push hooks. If a hook or the push fails, stop and report.
- Commit unsigned (owner-approved) as the owner's GitHub no-reply identity (see `git log`), never a work email. Everything pushed is public, so keep secrets and company details out of commits.
- `package-lock.json` must only reference `https://registry.npmjs.org/`; rewrite any private-mirror URLs before committing.
