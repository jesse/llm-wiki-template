#!/bin/sh
# Creates the folder structure defined in CLAUDE.md

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Prompt for the wiki's purpose
printf "What is the purpose of this wiki? "
read PURPOSE

if [ -z "$PURPOSE" ]; then
  echo "Error: purpose cannot be empty." >&2
  exit 1
fi

# Update the Purpose section in CLAUDE.md
CLAUDE_MD="$SCRIPT_DIR/CLAUDE.md"
if [ ! -f "$CLAUDE_MD" ]; then
  echo "Error: CLAUDE.md not found at $CLAUDE_MD" >&2
  exit 1
fi

awk -v purpose="$PURPOSE" '
  /^## Purpose$/ {
    print
    print ""
    print purpose
    skip = 1
    next
  }
  skip && /^## / {
    skip = 0
    print ""
    print
    next
  }
  skip { next }
  { print }
' "$CLAUDE_MD" > "$CLAUDE_MD.tmp" && mv "$CLAUDE_MD.tmp" "$CLAUDE_MD"

mkdir -p "$SCRIPT_DIR/raw"
mkdir -p "$SCRIPT_DIR/wiki"

# Create wiki/index.md if it doesn't already exist
if [ ! -f "$SCRIPT_DIR/wiki/index.md" ]; then
  cat > "$SCRIPT_DIR/wiki/index.md" << 'EOF'
# Wiki Index

Table of contents for the entire wiki.

---

*No pages yet.*
EOF
fi

# Create wiki/log.md if it doesn't already exist
if [ ! -f "$SCRIPT_DIR/wiki/log.md" ]; then
  cat > "$SCRIPT_DIR/wiki/log.md" << 'EOF'
# Wiki Log

Append-only record of all operations.

---
EOF
fi

echo "Done. Created:"
echo "  raw/          -- source documents (immutable)"
echo "  wiki/         -- markdown pages"
echo "  wiki/index.md -- table of contents"
echo "  wiki/log.md   -- operation log"
