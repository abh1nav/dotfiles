#!/bin/sh

# Working directory
cd $HOME

claude_dir="$HOME/.claude"
agents_dir="$HOME/.claude/agents"

# Fetch the submodules directory
git submodule update --init --recursive

# 1. If .claude/agents exists and is non-empty, echo "Cant do it" and exit
if [ -d "$agents_dir" ] && [ -n "$(ls -A "$agents_dir" 2>/dev/null)" ]; then
    echo "$agents_dir is non empty - delete it and try again"
    exit 1
fi

# 2. If .claude/agents exists (and we're still here, so it must be empty), remove it
if [ -d "$agents_dir" ]; then
    echo "Removing empty directory $agents_dir"
    rmdir "$agents_dir"
fi

# 3. If .claude exists, echo Hello world
if [ -d "$claude_dir" ]; then
    cd $claude_dir && ln -s $HOME/.dotfiles/claude/agents
fi
