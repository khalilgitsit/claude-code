# CLAUDE.md — claude-code repo

## Workflow

- **Default to PR workflow.** Do not push directly to `main`. Create a feature branch, push, open a PR, and merge.
- Branch naming: short and descriptive (`pobo-scaffold`, `statusline-theme-solarized`, etc.).
- PR titles under 70 characters. Use the body for details.

## What's here

- `statusline/` — modular Claude Code status line (themes, sections, config)
- `skills/` — Claude Code skills published from Khalil's vault
- `install.sh` — installs the status line into `~/.claude/`

## Skills

Skills live under `skills/{skill-name}/SKILL.md`. They are synced from `~/khalils-vault/.claude/skills/{skill-name}/` when updated. Keep the repo copy and the vault copy in sync — the vault is the working source of truth; the repo is the publishable mirror.
