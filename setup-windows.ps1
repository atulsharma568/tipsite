# TipSite Claude Code setup for Windows
# Run once after cloning the repo:
#   cd TipSite
#   .\setup-windows.ps1
#
# What it does:
#   1. Copies global CLAUDE.md rules to %USERPROFILE%\.claude\CLAUDE.md
#   2. Copies global skills  to %USERPROFILE%\.claude\skills\
#   3. Copies project memory to %USERPROFILE%\.claude\projects\<encoded-path>\memory\
#
# Project-local skills (.claude/skills/) and CLAUDE.md / AGENTS.md / PROGRESS.md
# are already in the repo — Claude Code loads them automatically when you open the folder.

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
$claude = "$env:USERPROFILE\.claude"

Write-Host "Setting up Claude Code config from repo..." -ForegroundColor Cyan

# 1. Global CLAUDE.md
$globalClaude = "$claude\CLAUDE.md"
if (Test-Path $globalClaude) {
    $backup = "$globalClaude.bak"
    Copy-Item $globalClaude $backup -Force
    Write-Host "  Backed up existing CLAUDE.md to CLAUDE.md.bak"
}
New-Item -ItemType Directory -Force -Path $claude | Out-Null
Copy-Item "$repo\.claude\global-claude.md" $globalClaude -Force
Write-Host "  [OK] Global CLAUDE.md -> $globalClaude"

# 2. Global skills
$skillsDest = "$claude\skills"
New-Item -ItemType Directory -Force -Path $skillsDest | Out-Null
Copy-Item "$repo\.claude\global-skills\*" $skillsDest -Recurse -Force
Write-Host "  [OK] Global skills -> $skillsDest"

# 3. Memory
# Encode the project path the way Claude Code does on Windows:
# Replace \ with - and : with nothing, prefix with -
$projectPath = $repo -replace '\\', '-' -replace ':', ''
# Claude Code encodes C:\Users\foo\Documents\TipSite as -C-Users-foo-Documents-TipSite
$encoded = "-" + ($projectPath -replace '^-+', '')
$memoryDest = "$claude\projects\$encoded\memory"
New-Item -ItemType Directory -Force -Path $memoryDest | Out-Null
Copy-Item "$repo\.claude\memory\*" $memoryDest -Force
Write-Host "  [OK] Memory files -> $memoryDest"

Write-Host ""
Write-Host "Done. Open the TipSite folder in Claude Code and everything is ready." -ForegroundColor Green
Write-Host "Project skills and CLAUDE.md / AGENTS.md / PROGRESS.md load automatically from the repo."
