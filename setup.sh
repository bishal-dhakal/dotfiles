#!/bin/bash

# ────── 🚀 macOS Development Environment Setup ──────
# Installs all required tools and dependencies

set -e  # Exit on any error

echo "🚀 Starting macOS Development Environment Setup..."

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

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only!"
    exit 1
fi

# ────── 📦 Install Homebrew ──────
print_step "Checking Homebrew installation..."
if ! command -v brew &> /dev/null; then
    print_step "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_success "Homebrew already installed"
fi

# Update Homebrew
print_step "Updating Homebrew..."
brew update

# ────── 🪟 Install AeroSpace ──────
print_step "Installing AeroSpace (Tiling Window Manager)..."
if ! brew list --cask aerospace &> /dev/null; then
    brew install --cask nikitabobko/tap/aerospace
    print_success "AeroSpace installed"
else
    print_success "AeroSpace already installed"
fi

# ────── 📊 Install SketchyBar ──────
print_step "Installing SketchyBar (Status Bar)..."
if ! brew list sketchybar &> /dev/null; then
    brew tap FelixKratz/formulae
    brew install sketchybar
    print_success "SketchyBar installed"
else
    print_success "SketchyBar already installed"
fi

# ────── 🖼️ Install JankyBorders (Window Borders) ──────
print_step "Installing JankyBorders (Window Borders)..."
if ! brew list borders &> /dev/null; then
    brew tap FelixKratz/formulae
    brew install borders
    print_success "JankyBorders installed"
else
    print_success "JankyBorders already installed"
fi

# ────── 🔤 Install Nerd Fonts ──────
print_step "Installing JetBrainsMono Nerd Font..."
if ! brew list --cask font-jetbrains-mono-nerd-font &> /dev/null; then
    brew tap homebrew/cask-fonts
    brew install --cask font-jetbrains-mono-nerd-font
    print_success "JetBrainsMono Nerd Font installed"
else
    print_success "JetBrainsMono Nerd Font already installed"
fi

print_step "Installing SketchyBar App Font..."
if ! brew list --cask font-sketchybar-app-font &> /dev/null; then
    brew install --cask font-sketchybar-app-font
    print_success "SketchyBar App Font installed"
else
    print_success "SketchyBar App Font already installed"
fi

# ────── 💻 Install Terminal Emulator ──────
print_step "Installing Alacritty terminal emulator..."

if ! brew list --cask alacritty &> /dev/null; then
    brew install --cask alacritty
    print_success "Alacritty installed"
else
    print_success "Alacritty already installed"
fi

# ────── 📝 Install Development Tools ──────
print_step "Installing development tools..."

# Neovim
if ! brew list neovim &> /dev/null; then
    brew install neovim
    print_success "Neovim installed"
else
    print_success "Neovim already installed"
fi

# Tmux
if ! brew list tmux &> /dev/null; then
    brew install tmux
    print_success "Tmux installed"
else
    print_success "Tmux already installed"
fi

# Git (usually pre-installed, but ensure latest)
brew install git

# Additional CLI tools
print_step "Installing additional CLI tools..."

# Bat (better cat)
if ! brew list bat &> /dev/null; then
    brew install bat
    print_success "Bat installed"
else
    print_success "Bat already installed"
fi

# Eza (better ls)
if ! brew list eza &> /dev/null; then
    brew install eza
    print_success "Eza installed"
else
    print_success "Eza already installed"
fi

# Fzf (fuzzy finder)
if ! brew list fzf &> /dev/null; then
    brew install fzf
    print_success "Fzf installed"
else
    print_success "Fzf already installed"
fi

# Fd (better find)
if ! brew list fd &> /dev/null; then
    brew install fd
    print_success "Fd installed"
else
    print_success "Fd already installed"
fi

# Zoxide (better cd)
if ! brew list zoxide &> /dev/null; then
    brew install zoxide
    print_success "Zoxide installed"
else
    print_success "Zoxide already installed"
fi

# Starship (prompt)
if ! brew list starship &> /dev/null; then
    brew install starship
    print_success "Starship installed"
else
    print_success "Starship already installed"
fi

# Btop (system monitor)
if ! brew list btop &> /dev/null; then
    brew install btop
    print_success "Btop installed"
else
    print_success "Btop already installed"
fi

# Htop (system monitor)
if ! brew list htop &> /dev/null; then
    brew install htop
    print_success "Htop installed"
else
    print_success "Htop already installed"
fi

# Neofetch (system info)
if ! brew list neofetch &> /dev/null; then
    brew install neofetch
    print_success "Neofetch installed"
else
    print_success "Neofetch already installed"
fi

# TheFuck (command correction)
if ! brew list thefuck &> /dev/null; then
    brew install thefuck
    print_success "TheFuck installed"
else
    print_success "TheFuck already installed"
fi

# ────── 🔧 Configure Services ──────
print_step "Configuring services..."

# Create config directories
mkdir -p ~/.config/sketchybar
mkdir -p ~/.config/tmux  
mkdir -p ~/.config/aerospace
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/bat
mkdir -p ~/.config/borders
mkdir -p ~/.config/btop
mkdir -p ~/.config/htop
mkdir -p ~/.config/neofetch
mkdir -p ~/.config/thefuck
mkdir -p ~/.config/starship

# ────── 🎯 Final Steps ──────
print_step "Performing final setup..."

# Refresh font cache
print_step "Refreshing font cache..."
fc-cache -f -v 2>/dev/null || true

print_success "All tools installed successfully!"
echo ""
echo -e "${GREEN}🎉 Setup Complete!${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Run './link.sh' to symlink all configurations"
echo "2. Restart your terminal"
echo "3. Start AeroSpace and SketchyBar services"
echo "4. Enjoy your new development environment!"
echo ""
echo -e "${BLUE}Installed Tools:${NC}"
echo "• AeroSpace (Tiling Window Manager)"
echo "• SketchyBar (Status Bar)"
echo "• JankyBorders (Window Borders)"
echo "• JetBrainsMono Nerd Font"
echo "• Alacritty (Terminal Emulator)"
echo "• Neovim (Text Editor)"
echo "• Tmux (Terminal Multiplexer)"
echo "• Zsh (Shell)"
echo "• Git (Version Control)"
echo "• Bat (Better cat)"
echo "• Eza (Better ls)"
echo "• Fzf (Fuzzy finder)"
echo "• Fd (Better find)"
echo "• Zoxide (Better cd)"
echo "• Starship (Shell prompt)"
echo "• Btop (System monitor)"
echo "• Htop (System monitor)"
echo "• Neofetch (System info)"
echo "• TheFuck (Command correction)"
echo ""
