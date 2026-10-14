#!/usr/bin/env bash
# Install the Claude Code skills listed in agent-skills/README.md into this
# project's .claude/skills/ (git-ignored). Each source is pinned to the commit
# that was reviewed, so a reinstall gets the same files.
#
#   agent-skills/install.sh              install every skill
#   agent-skills/install.sh impeccable   install only the named skills
#   agent-skills/install.sh --list       print the skill names
#
# Installing copies files only: no skill script, hook or package install runs.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${SKILLS_DEST:-$ROOT/.claude/skills}"

# name | GitHub repo | pinned commit | path to the skill inside the repo
SKILLS="
impeccable|pbakaus/impeccable|2f98774f86bc05563876643db37e6c37c322850f|.claude/skills/impeccable
ui-ux-pro-max|nextlevelbuilder/ui-ux-pro-max-skill|7246805992a42b7bba37d4cac83b01416f0c6c44|.claude/skills/ui-ux-pro-max
design|nextlevelbuilder/ui-ux-pro-max-skill|7246805992a42b7bba37d4cac83b01416f0c6c44|.claude/skills/design
design-system|nextlevelbuilder/ui-ux-pro-max-skill|7246805992a42b7bba37d4cac83b01416f0c6c44|.claude/skills/design-system
ui-styling|nextlevelbuilder/ui-ux-pro-max-skill|7246805992a42b7bba37d4cac83b01416f0c6c44|.claude/skills/ui-styling
brand|nextlevelbuilder/ui-ux-pro-max-skill|7246805992a42b7bba37d4cac83b01416f0c6c44|.claude/skills/brand
banner-design|nextlevelbuilder/ui-ux-pro-max-skill|7246805992a42b7bba37d4cac83b01416f0c6c44|.claude/skills/banner-design
slides|nextlevelbuilder/ui-ux-pro-max-skill|7246805992a42b7bba37d4cac83b01416f0c6c44|.claude/skills/slides
design-taste-frontend|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/taste-skill
design-taste-frontend-v1|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/taste-skill-v1
high-end-visual-design|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/soft-skill
minimalist-ui|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/minimalist-skill
industrial-brutalist-ui|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/brutalist-skill
gpt-taste|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/gpt-tasteskill
stitch-design-taste|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/stitch-skill
redesign-existing-projects|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/redesign-skill
image-to-code|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/image-to-code-skill
imagegen-frontend-web|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/imagegen-frontend-web
imagegen-frontend-mobile|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/imagegen-frontend-mobile
brandkit|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/brandkit
full-output-enforcement|Leonxlnx/taste-skill|a60a36dc2bb3bb77ccf17f2f62041f5ca8a458b9|skills/output-skill
animate|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/animate
animate-expo|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/animate-expo
animation-performance|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/animation-performance
animation-vocabulary|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/animation-vocabulary
apple-design|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/apple-design
ask-sonner|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/ask-sonner
break-ui|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/break-ui
emil-design-eng|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/emil-design-eng
find-animation-opportunities|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/find-animation-opportunities
improve-animations|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/improve-animations
mobile-native|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/mobile-native
pick-ui-library|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/pick-ui-library
prototype|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/prototype
review-animations|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/review-animations
write-swift|emilkowalski/skills|2d228630ba1446365f614a108cb8252f1feda202|skills/write-swift
frontend-design|anthropics/skills|dbd4588f9e1033efb41dad4bef2f7947c8993d44|skills/frontend-design
web-design-guidelines|vercel-labs/agent-skills|063bee94c3f4df8453406c830b0a7df0f2860278|skills/web-design-guidelines
vercel-react-best-practices|vercel-labs/agent-skills|063bee94c3f4df8453406c830b0a7df0f2860278|skills/react-best-practices
vercel-composition-patterns|vercel-labs/agent-skills|063bee94c3f4df8453406c830b0a7df0f2860278|skills/composition-patterns
vercel-react-native-skills|vercel-labs/agent-skills|063bee94c3f4df8453406c830b0a7df0f2860278|skills/react-native-skills
bencium-controlled-ux-designer|bencium/bencium-claude-code-design-skill|5de46a39b4640fa419560cd0b67e4c4b50dac802|bencium-controlled-ux-designer/skills/bencium-controlled-ux-designer
bencium-innovative-ux-designer|bencium/bencium-claude-code-design-skill|5de46a39b4640fa419560cd0b67e4c4b50dac802|bencium-innovative-ux-designer/skills/bencium-innovative-ux-designer
accessibility-audit|accesslint/claude-marketplace|2e9d7336678302d0bc08848e92542560295b34d3|plugins/accesslint/skills/accessibility-audit
accessibility-scan|accesslint/claude-marketplace|2e9d7336678302d0bc08848e92542560295b34d3|plugins/accesslint/skills/accessibility-scan
accessibility-inspect|accesslint/claude-marketplace|2e9d7336678302d0bc08848e92542560295b34d3|plugins/accesslint/skills/accessibility-inspect
accessibility-fix|accesslint/claude-marketplace|2e9d7336678302d0bc08848e92542560295b34d3|plugins/accesslint/skills/accessibility-fix
accessibility-diff|accesslint/claude-marketplace|2e9d7336678302d0bc08848e92542560295b34d3|plugins/accesslint/skills/accessibility-diff
img2threejs|img2threejs/img2threejs|d508b596cb221f1509f6e50ab68fce275a5cfb44|.
graphify|safishamsi/graphify|041771be72229bb2c8d8205b9cc6871c6be52b91|graphify
playwright-cli|microsoft/playwright-cli|b85c7a736bb473bf55b584e54a09ffa698d6d871|skills/playwright-cli
task-observer|rebelytics/one-skill-to-rule-them-all|56e890712273ce231b478adc56ee2eb81101c3d6|.
find-skills|vercel-labs/skills|13e4063a1cf913f5606d57d42ab83a86f5001e04|skills/find-skills
"

if [ "${1:-}" = "--list" ]; then
  echo "$SKILLS" | awk -F'|' 'NF { print $1 }'
  exit 0
fi

WANT=" $* "
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
mkdir -p "$DEST"

# Fetch one repo at one commit, once.
checkout() {
  local repo="$1" commit="$2" dir="$WORK/${1//\//_}"
  if [ ! -d "$dir" ]; then
    git init -q "$dir"
    git -C "$dir" fetch -q --depth 1 "https://github.com/$repo.git" "$commit"
    git -C "$dir" -c advice.detachedHead=false checkout -q FETCH_HEAD
  fi
  echo "$dir"
}

installed=0
while IFS='|' read -r name repo commit path; do
  [ -n "$name" ] || continue
  if [ "$#" -gt 0 ] && [[ "$WANT" != *" $name "* ]]; then continue; fi

  src="$(checkout "$repo" "$commit")"
  out="$DEST/$name"
  rm -rf "$out"

  case "$name" in
    img2threejs)
      # The skill only; its npx installer would link it into every agent's global folder.
      mkdir -p "$out/scripts"
      cp -R "$src/SKILL.md" "$src/LICENSE" "$src/forge" "$src/grimoire" "$src/docs" "$out/"
      rm -rf "$out/forge/tests"
      cp "$src/scripts/capture_threejs_playwright.py" "$src/scripts/character_audit.sh" "$out/scripts/"
      ;;
    graphify)
      # The skill text only; `graphify install` would edit ~/.claude/CLAUDE.md and add hooks.
      mkdir -p "$out"
      cp "$src/$path/skill.md" "$out/SKILL.md"
      cp -R "$src/$path/skills/claude/references" "$out/"
      ;;
    task-observer)
      mkdir -p "$out"
      cp -R "$src/SKILL.md" "$src/references" "$src/scripts" "$out/"
      cp "$src"/LICENSE* "$out/" 2>/dev/null || true
      ;;
    *)
      cp -R "$src/$path" "$out"
      ;;
  esac
  rm -f "$out/.coverage"

  # AccessLint skills link to ../shared/methodology.md.
  if [[ "$name" == accessibility-* ]] && [ ! -d "$DEST/shared" ]; then
    cp -R "$src/plugins/accesslint/skills/shared" "$DEST/shared"
  fi

  echo "installed $name"
  installed=$((installed + 1))
done <<< "$SKILLS"

if [ "$installed" -eq 0 ]; then
  echo "No skill matched. Run with --list to see the names." >&2
  exit 1
fi
echo "$installed skill(s) in $DEST. Start a new Claude Code session here to load them."
