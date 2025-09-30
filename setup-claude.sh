#!/bin/sh

set -e

# Working directory
cd $HOME

claude_dir="$HOME/.claude"
agents_dir="$HOME/.claude/agents"
settings_file="$HOME/.claude/settings.json"

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
# Add the notification hook
#
# 1. Check if jq is installed
if ! command -v jq >/dev/null 2>&1; then
   echo "❌ Error: jq is required but not installed."
   echo "Please install it with: brew install jq"
   exit 1
fi
#
# 2. Create settings.json if it doesn't exist
if [ ! -f "$settings_file" ]; then
   echo '{}' > "$settings_file"
fi
#
# 3. Use jq to ensure the Notification hook exists
jq '.hooks.Notification = [
   {
       "matcher": "",
       "hooks": [
           {
               "type": "command",
               "command": "osascript -e \"display notification \\\"Claude Code needs your attention\\\" with title \\\"Claude Code\\\"\""
           }
       ]
   }
]' "$settings_file" > "$settings_file.tmp" && mv "$settings_file.tmp" "$settings_file"
echo "✅ Notification hook configured in $settings_file"
