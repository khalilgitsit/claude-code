# Claude Code Setup

My Claude Code configuration. Currently includes the status line.

## Status Line

A modular, configurable status line for Claude Code with themes, responsive layout, and per-section customization.

**Line 1** (session info):
```
── ━━━╌╌╌╌╌╌╌╌╌╌╌╌╌ 23% | Opus | DEFAULT | 8m0s | 207K ↓  8K ↑ | $1.37
```

**Line 2** (environment):
```
── 5h:12% | 7d:3% | 13 skills | 2 mcp | khalils-vault
```

**Line 3** (optional):
```
── FILES: CLAUDE.md, ~CLAUDE.md, 8 rules
```

### Install

```bash
git clone https://github.com/khalilgitsit/claude-code.git
cd claude-code
chmod +x install.sh
./install.sh
```

Then add this to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "/path/to/home/.claude/statusline/statusline.sh"
  }
}
```

### Configure

Edit `~/.claude/statusline.conf`:

```bash
# Sections to display (order matters)
STATUSLINE_SECTIONS="context,env,tokens,cost,rate,skills,mcps,agent,dir,files"

# Theme: dark | light | minimal
STATUSLINE_THEME="dark"
```

See `statusline/statusline.defaults.conf` for all options.

### Available sections

| Section   | Shows | Line |
|-----------|-------|------|
| `context` | Context window bar + percentage | 1 |
| `env`     | Model, permissions, session time | 1 |
| `tokens`  | Input/output token counts | 1 or 2 |
| `cost`    | Session cost | 1 |
| `rate`    | 5-hour and 7-day rate limit usage | 2 |
| `skills`  | Loaded skills count | 2 |
| `mcps`    | MCP server count | 2 |
| `agent`   | Active agent name + worktree | 1 |
| `dir`     | Working directory | 2 |
| `files`   | Loaded context files | 3 |
| `quote`   | Quote of the day | 3 |

### Themes

- **dark** -- 24-bit color for dark terminals (default)
- **light** -- 24-bit color for light terminals
- **minimal** -- 16-color ANSI, works everywhere

Create your own: copy `statusline/themes/dark.sh`, change colors, set `STATUSLINE_THEME="mytheme"`.

### Add a section

Create `statusline/sections/mysection.sh`:

```bash
render_mysection() {
    append_line2 "${GREEN}hello${R}"
}
```

Then add `mysection` to `STATUSLINE_SECTIONS` in your config.

### Requirements

- bash 4+
- jq
