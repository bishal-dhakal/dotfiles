#!/bin/bash
# Each display needs its own Space or macOS blacks out the other monitor in fullscreen.
set -euo pipefail

defaults write com.apple.spaces spans-displays -bool false
killall SystemUIServer 2>/dev/null || true

echo "Enabled: Displays have separate Spaces (spans-displays=false)"
echo ""
echo "You must log out and log back in for this to take effect."
echo "System Settings → Desktop & Dock → confirm the toggle is ON."
