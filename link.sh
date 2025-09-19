#!/bin/bash

# ────── 🔗 Dotfiles Symlink Script ──────
# Links all configuration files to their proper locations

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_step() {
    echo -e "${BLUE}▶ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Get the directory where this script is located (dotfiles root)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔗 Linking dotfiles from: $DOTFILES_DIR"
echo ""

# Function to create symlink with backup
link_config() {
    local source="$1"
    local target="$2"
    local description="$3"
    
    print_step "Linking $description..."
    
    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # If target exists and is not a symlink, back it up
    if [[ -e "$target" && ! -L "$target" ]]; then
        print_warning "Backing up existing $description to ${target}.backup"
        mv "$target" "${target}.backup"
    elif [[ -L "$target" ]]; then
        # Remove existing symlink
        rm "$target"
    fi
    
    # Create the symlink
    if ln -sf "$source" "$target"; then
        print_success "$description linked successfully"
    else
        print_error "Failed to link $description"
        return 1
    fi
}

# ────── 🚀 AeroSpace Configuration ──────
link_config \
    "$DOTFILES_DIR/aerospace/aerospace.toml" \
    "$HOME/.config/aerospace/aerospace.toml" \
    "AeroSpace config"

# ────── 📊 SketchyBar Configuration ──────
link_config \
    "$DOTFILES_DIR/sketchybar" \
    "$HOME/.config/sketchybar" \
    "SketchyBar config directory"

# ────── 💻 Terminal Configuration ──────

# Alacritty
link_config \
    "$DOTFILES_DIR/alacritty" \
    "$HOME/.config/alacritty" \
    "Alacritty config directory"

# ────── 🐚 Shell Configurations ──────

# Zsh
link_config \
    "$DOTFILES_DIR/.zshrc" \
    "$HOME/.zshrc" \
    "Zsh config"

# Starship
link_config \
    "$DOTFILES_DIR/starship.toml" \
    "$HOME/.config/starship.toml" \
    "Starship config"

# ────── 🎛️ Multiplexer Configurations ──────

# Tmux
link_config \
    "$DOTFILES_DIR/tmux/tmux.conf" \
    "$HOME/.config/tmux/tmux.conf" \
    "Tmux config"

# Also create traditional tmux config location for compatibility
link_config \
    "$DOTFILES_DIR/tmux/tmux.conf" \
    "$HOME/.tmux.conf" \
    "Tmux config (legacy location)"

# ────── 📝 Editor Configurations ──────

# Neovim
link_config \
    "$DOTFILES_DIR/nvim" \
    "$HOME/.config/nvim" \
    "Neovim config directory"

# ────── 🔧 Additional Tools Configurations ──────

# Zsh additional scripts
if [[ -d "$DOTFILES_DIR/zsh" ]]; then
    link_config \
        "$DOTFILES_DIR/zsh" \
        "$HOME/.config/zsh" \
        "Zsh additional scripts"
fi

# Bat (better cat)
link_config \
    "$DOTFILES_DIR/bat" \
    "$HOME/.config/bat" \
    "Bat config directory"

# Borders (JankyBorders)
link_config \
    "$DOTFILES_DIR/borders/bordersrc" \
    "$HOME/.config/borders/bordersrc" \
    "Borders config"

# Btop (system monitor)
link_config \
    "$DOTFILES_DIR/btop/btop.conf" \
    "$HOME/.config/btop/btop.conf" \
    "Btop config"

# Htop (system monitor)
link_config \
    "$DOTFILES_DIR/htop/htoprc" \
    "$HOME/.config/htop/htoprc" \
    "Htop config"

# Neofetch (system info)
link_config \
    "$DOTFILES_DIR/neofetch/config.conf" \
    "$HOME/.config/neofetch/config.conf" \
    "Neofetch config"

# TheFuck (command correction)
link_config \
    "$DOTFILES_DIR/thefuck/settings.py" \
    "$HOME/.config/thefuck/settings.py" \
    "TheFuck config"

# ────── 📱 macOS Specific Configurations ──────

# Create LaunchAgents directory for services
mkdir -p "$HOME/Library/LaunchAgents"

# ────── 🎯 Service Management ──────
print_step "Setting up services..."

# Make scripts executable
chmod +x "$DOTFILES_DIR/sketchybar/sketchybarrc"
chmod +x "$DOTFILES_DIR/sketchybar/plugins/"*.sh
chmod +x "$DOTFILES_DIR/sketchybar/colors.sh"
chmod +x "$DOTFILES_DIR/sketchybar/icons.sh"

print_success "All scripts made executable"

# ────── 🔄 Service Restart Instructions ──────
echo ""
print_step "Service Management:"
echo ""
echo -e "${YELLOW}To start/restart services:${NC}"
echo ""
echo -e "${BLUE}AeroSpace:${NC}"
echo "• brew services start aerospace"
echo "• brew services restart aerospace"
echo ""
echo -e "${BLUE}SketchyBar:${NC}"
echo "• brew services start sketchybar"
echo "• brew services restart sketchybar"
echo ""
echo -e "${BLUE}JankyBorders:${NC}"
echo "• brew services start borders"
echo "• brew services restart borders"
echo ""

# ────── 🎉 Completion Message ──────
echo ""
print_success "All configurations linked successfully!"
echo ""
echo -e "${GREEN}🎉 Dotfiles Setup Complete!${NC}"
echo ""
echo -e "${YELLOW}What's been linked:${NC}"
echo "• AeroSpace → ~/.config/aerospace/aerospace.toml"
echo "• SketchyBar → ~/.config/sketchybar/"
echo "• Alacritty → ~/.config/alacritty/"
echo "• Zsh → ~/.zshrc"
echo "• Starship → ~/.config/starship.toml"
echo "• Tmux → ~/.config/tmux/tmux.conf"
echo "• Neovim → ~/.config/nvim/"
echo "• Bat → ~/.config/bat/"
echo "• Borders → ~/.config/borders/bordersrc"
echo "• Btop → ~/.config/btop/btop.conf"
echo "• Htop → ~/.config/htop/htoprc"
echo "• Neofetch → ~/.config/neofetch/config.conf"
echo "• TheFuck → ~/.config/thefuck/settings.py"
echo ""
echo -e "${BLUE}Next Steps:${NC}"
echo "1. Restart your terminal"
echo "2. Start the services (commands shown above)"
echo "3. Log out and log back in for full effect"
echo "4. Enjoy your new setup!"
echo ""
echo -e "${YELLOW}Troubleshooting:${NC}"
echo "• If services don't start, try: brew services restart <service>"
echo "• Check logs: tail -f /opt/homebrew/var/log/sketchybar.log"
echo "• Reload configs: <Alt+Shift+R> for SketchyBar"
echo ""