#!/bin/bash
# Install Claude Code status line
# Usage: ./install.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.claude/statusline"

echo "Installing Claude Code status line..."

# Copy statusline directory
if [ -d "$TARGET_DIR" ]; then
    echo "  Backing up existing statusline to ${TARGET_DIR}.bak"
    rm -rf "${TARGET_DIR}.bak"
    mv "$TARGET_DIR" "${TARGET_DIR}.bak"
fi

mkdir -p "$TARGET_DIR"
cp -r "$SCRIPT_DIR/statusline/"* "$TARGET_DIR/"
chmod +x "$TARGET_DIR/statusline.sh"
mkdir -p "$TARGET_DIR/cache"

# Copy example config if no config exists
if [ ! -f "$HOME/.claude/statusline.conf" ]; then
    cp "$SCRIPT_DIR/statusline.conf.example" "$HOME/.claude/statusline.conf"
    echo "  Created ~/.claude/statusline.conf (edit to customize)"
else
    echo "  ~/.claude/statusline.conf already exists (kept yours)"
fi

echo ""
echo "Done. Add this to your ~/.claude/settings.json:"
echo ""
echo '  "statusLine": {'
echo '    "type": "command",'
echo "    \"command\": \"$TARGET_DIR/statusline.sh\""
echo '  }'
echo ""
echo "Then restart Claude Code."
