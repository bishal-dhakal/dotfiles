#!/bin/bash
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
CONFIG_DIR="$HOME/.config/aerospace"
mkdir -p "$CONFIG_DIR"
ln -sf "$DOTFILES/aerospace/aerospace.toml" "$CONFIG_DIR/aerospace.toml"
# Only one config path — duplicate ~/.aerospace.toml makes AeroSpace refuse to load
rm -f "$HOME/.aerospace.toml"

AEROSPACE_BIN="/opt/homebrew/Caskroom/aerospace/0.20.2-Beta/AeroSpace-v0.20.2-Beta/bin/aerospace"
if [[ -x "$AEROSPACE_BIN" ]]; then
  "$AEROSPACE_BIN" reload-config
  echo "AeroSpace config reloaded."
elif command -v aerospace >/dev/null 2>&1; then
  aerospace reload-config
  echo "AeroSpace config reloaded."
else
  echo "Restart AeroSpace.app to pick up the config."
fi

echo "Config: $CONFIG_DIR/aerospace.toml"
