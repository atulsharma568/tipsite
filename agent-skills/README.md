# Agent skills

Claude Code skills used on this project, with where each comes from, so they can be reinstalled on a new machine. The skills themselves are not committed: they install into `.claude/skills/`, which is git-ignored.

## Install

```bash
agent-skills/install.sh                       # all skills
agent-skills/install.sh impeccable slides     # only the named ones
agent-skills/install.sh --list                # names
```

The script fetches each source repo at the pinned commit in `install.sh` and copies the skill folder. It runs no skill script and installs no hooks or packages. Start a new Claude Code session in the repo afterwards so the skills load.

To move to a newer version of a skill, review the upstream changes first, then update its commit in `install.sh`.

## Skills

All sources were reviewed on 2026-10-14 at the pinned commit.

### Design

| Skill | Source | What it is for |
|---|---|---|
| impeccable | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Design vocabulary and audits; uses `PRODUCT.md`, `DESIGN.md` and `.impeccable/` |
| ui-ux-pro-max | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | Searchable styles, palettes, font pairings and UX rules |
| design, design-system, ui-styling, brand, banner-design, slides | same repo | Logos and brand identity, tokens, shadcn/Tailwind, brand guidelines, banners, slides |
| design-taste-frontend (+ v1), high-end-visual-design, minimalist-ui, industrial-brutalist-ui, gpt-taste, stitch-design-taste, redesign-existing-projects, full-output-enforcement | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | Art direction for landing pages in several styles |
| image-to-code, imagegen-frontend-web, imagegen-frontend-mobile, brandkit | same repo | Image-led design; need an image-generation tool |
| emil-design-eng, animate, animation-vocabulary, animation-performance, improve-animations, review-animations, find-animation-opportunities | [emilkowalski/skills](https://github.com/emilkowalski/skills) | Emil Kowalski's design-engineering and motion craft: easing, timing, performance, audits |
| apple-design, break-ui, prototype, pick-ui-library, ask-sonner | same repo | Apple-style interface rules, edge-case stress tests, quick prototypes, library picks, the Sonner toast library |
| animate-expo, mobile-native, write-swift | same repo | Expo/React Native and Swift; not used by this web project |
| frontend-design | [anthropics/skills](https://github.com/anthropics/skills) | Anthropic's frontend design skill |
| bencium-controlled-ux-designer, bencium-innovative-ux-designer | [bencium/bencium-claude-code-design-skill](https://github.com/bencium/bencium-claude-code-design-skill) | UX, accessibility, responsive and motion specs; asks before design decisions |
| img2threejs | [img2threejs/img2threejs](https://github.com/img2threejs/img2threejs) | Rebuilds an object from an image as a Three.js model |

### Code quality and accessibility

| Skill | Source | What it is for |
|---|---|---|
| web-design-guidelines | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | Interface audit against Vercel's guidelines |
| vercel-react-best-practices, vercel-composition-patterns, vercel-react-native-skills | same repo | React/Next.js performance, component patterns, React Native |
| accessibility-audit, -scan, -inspect, -fix, -diff | [accesslint/claude-marketplace](https://github.com/accesslint/claude-marketplace) | WCAG audits, scans and fixes (the `shared/` folder is installed with them) |

### Utilities

| Skill | Source | What it is for |
|---|---|---|
| playwright-cli | [microsoft/playwright-cli](https://github.com/microsoft/playwright-cli) | Browser automation and screenshots |
| graphify | [safishamsi/graphify](https://github.com/safishamsi/graphify) | Knowledge graph of the codebase |
| task-observer | [rebelytics/one-skill-to-rule-them-all](https://github.com/rebelytics/one-skill-to-rule-them-all) | Logs how skills behave and proposes improvements |
| find-skills | [vercel-labs/skills](https://github.com/vercel-labs/skills) | Searches skills.sh for more skills |

Built into Claude Code, so not listed here: claude-api, update-config, keybindings-help, fewer-permission-prompts, simplify, init, code-review and security-review.

## Notes from the review

- **impeccable**: on first use its launcher downloads the engine binary from the project's GitHub releases into `~/.impeccable/` and runs it. Leave `/impeccable hooks on` off unless you want that binary to run after every UI edit.
- **design**: image scripts read `~/.claude/.env` and `~/.claude/skills/.env`, and need a Gemini API key. Keep unrelated secrets out of those files.
- **web-design-guidelines**: fetches its rules from Vercel's GitHub each time it runs.
- **AccessLint**: scans run `npx -y @accesslint/cli@latest` and `@accesslint/chrome@latest`. Only the skills are installed; the plugin's MCP server is not.
- **graphify**: needs the `graphifyy` Python package (Python 3.10+). Only the skill text is installed; do not run `graphify install` or `graphify claude install`, which edit the global `~/.claude/CLAUDE.md` and add hooks.
- **playwright-cli**: needs `npm install -g @playwright/cli`. Its `allowed-tools` line pre-approves every `playwright-cli` command.
- **img2threejs**: installed by copying only the skill files. Its `npx img2threejs install` links it into every agent's global skills folder.
- **task-observer**: does nothing until an activation line is added to `CLAUDE.md` or a session-start hook is set up; neither is done here.
- **emilkowalski/skills** (added 2026-10-14): markdown only, MIT; no scripts, hooks or network calls. Its "pick-ui-library" suggests packages (motion, NumberFlow and others); this project uses GSAP, so check with the owner before adding a library.
- **find-skills**: its install step uses `npx skills add <pkg> -g -y` (global, no prompt). Install suggestions into this project instead.

## Not installed

- **agent-reach** ([Panniantong/Agent-Reach](https://github.com/Panniantong/Agent-Reach)): installed, then removed. It pulls many unpinned tools, uses logged-in browser sessions and cookies, and claims every web lookup.
- **100p**: no source found.
