#!/bin/bash
set -e

# Claude Code Template Setup Script
# Copies template files from src/ to target directory

# Parse target directory - prompt if not provided
TARGET_DIR="$1"

if [ -z "$TARGET_DIR" ]; then
    echo "Enter the target directory path for Claude Code templates:"
    read -r TARGET_DIR

    if [ -z "$TARGET_DIR" ]; then
        echo "Error: Target directory is required" >&2
        exit 1
    fi
fi

# Validate target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Target directory does not exist: $TARGET_DIR" >&2
    exit 1
fi

# Convert to absolute path for clearer messaging
TARGET_DIR=$(cd "$TARGET_DIR" && pwd)

# Get script directory to locate source templates
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Validate source templates exist
if [ ! -d "$SCRIPT_DIR/src/.claude" ] || [ ! -d "$SCRIPT_DIR/src/.dev-docs" ]; then
    echo "Error: Source templates not found in $SCRIPT_DIR/src/" >&2
    exit 2
fi

# Check for existing .claude directory and warn user
if [ -d "$TARGET_DIR/.claude" ]; then
    echo "Warning: .claude/ already exists in $TARGET_DIR"
    echo "This will overwrite existing files. Continue? (y/n): "
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "Setup cancelled."
        exit 0
    fi
fi

# Copy templates with preserved permissions
echo "Installing Claude Code templates to $TARGET_DIR..."
cp -rp "$SCRIPT_DIR/src/.claude" "$TARGET_DIR/"
cp -rp "$SCRIPT_DIR/src/.dev-docs" "$TARGET_DIR/"

# Display success message
echo ""
echo "Success! Claude Code templates installed to: $TARGET_DIR"
echo ""
echo "Installed:"
echo "  - .claude/     (agents, commands, hooks, skills, settings)"
echo "  - .dev-docs/   (documentation structure)"
echo ""
echo "Next steps:"
echo "  1. Review and customize .claude/settings.json"
echo "  2. Explore agents in .claude/agents/"
echo "  3. Read .claude/DEVELOPMENT_PRINCIPLES.md"
