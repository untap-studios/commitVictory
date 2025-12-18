#!/bin/bash

# Get the path to this project folder
# ...existing code...
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Try Git Bash's pwd -W (preferred), otherwise convert /c/... -> C:/...
if WIN_PROJECT_DIR="$(cd "$SCRIPT_DIR" && pwd -W 2>/dev/null)"; then
  PROJECT_DIR="$WIN_PROJECT_DIR"
else
  PROJECT_DIR="$(echo "$SCRIPT_DIR" | sed -E 's|^/([a-zA-Z])/(.*)|\1:/\2|' | sed 's|\\|/|g')"
fi
# ...existing code...

# 1. Play Sound (Background)
powershell.exe -ExecutionPolicy Bypass -File "$PROJECT_DIR/assets/play_sound.ps1" &

# 2. Pop up the Image Window (Background)
powershell.exe -ExecutionPolicy Bypass -File "$PROJECT_DIR/assets/show_image.ps1" &

# 3. Print the text in the terminal as a backup
echo -e "\e[1;33m"
echo "---------------------------"
echo "    VICTORY ACHIEVED       "
echo "---------------------------"
echo -e "\e[0m"