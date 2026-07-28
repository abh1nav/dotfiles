#!/bin/sh

set -e

# Working directory
cd $HOME

claude_dir="$HOME/.claude"
agents_dir="$HOME/.claude/agents"
settings_file="$HOME/.claude/settings.json"
claude_md="$HOME/.claude/CLAUDE.md"

# Fetch the submodules directory
git submodule update --init --recursive

#
# Setup the agents link
#
# 1. If .claude/agents exists and is non-empty, show error and exit
if [ -d "$agents_dir" ] && [ -n "$(ls -A "$agents_dir" 2>/dev/null)" ]; then
    echo "$agents_dir is non empty - delete it and try again"
    exit 1
fi
#
# 2. If .claude/agents exists (and we're still here, so it must be empty), remove it
if [ -d "$agents_dir" ]; then
    echo "Removing empty directory $agents_dir"
    rmdir "$agents_dir"
fi
#
# 3. If .claude exists, echo Hello world
if [ -d "$claude_dir" ]; then
    cd $claude_dir && ln -s $HOME/.dotfiles/claude/agents
fi
#
#
# Setup the settings link
#
# 1. If settings.json exists as a regular file (not a symlink), back it up
if [ -f "$settings_file" ] && [ ! -L "$settings_file" ]; then
    echo "Backing up existing $settings_file to $settings_file.bak"
    mv "$settings_file" "$settings_file.bak"
fi
#
# 2. Create (or refresh) the symlink to the dotfiles settings
ln -sf "$HOME/.dotfiles/claude/settings.json" "$settings_file"
echo "✅ Settings symlink created: $settings_file -> $HOME/.dotfiles/claude/settings.json"
#
#
# Setup the CLAUDE.md link
#
# 1. If CLAUDE.md exists as a regular file (not a symlink), back it up
if [ -f "$claude_md" ] && [ ! -L "$claude_md" ]; then
    echo "Backing up existing $claude_md to $claude_md.bak"
    mv "$claude_md" "$claude_md.bak"
fi
#
# 2. Create (or refresh) the symlink to the dotfiles CLAUDE.md
ln -sf "$HOME/.dotfiles/claude/CLAUDE.md" "$claude_md"
echo "✅ CLAUDE.md symlink created: $claude_md -> $HOME/.dotfiles/claude/CLAUDE.md"
