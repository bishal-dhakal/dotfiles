# 🚀 macOS Dotfiles Configuration

A comprehensive macOS development environment setup with tiling window management, modern CLI tools, and beautiful configurations.

## ✨ Features

- **🪟 AeroSpace**: Tiling window manager for macOS
- **📊 SketchyBar**: Customizable status bar with Lua configuration
- **🖼️ JankyBorders**: Window borders for visual clarity
- **💻 Alacritty**: GPU-accelerated terminal emulator
- **📝 Neovim**: Modern text editor with LazyVim
- **🎛️ Tmux**: Terminal multiplexer
- **🐚 Zsh**: Enhanced shell with modern tools
- **⭐ Starship**: Beautiful shell prompt
- **🔧 Modern CLI Tools**: bat, eza, fzf, fd, zoxide, and more

## 🛠️ Installation

### Prerequisites

- macOS (tested on macOS 14+)
- Command Line Tools for Xcode

### Quick Setup

1. **Clone the repository**:
   ```bash
   git clone <your-repo-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install all tools and dependencies**:
   ```bash
   ./setup.sh
   ```

3. **Link all configurations**:
   ```bash
   ./link.sh
   ```

4. **Start services**:
   ```bash
   # Start AeroSpace
   brew services start aerospace
   
   # Start SketchyBar
   brew services start sketchybar
   
   # Start JankyBorders
   brew services start borders
   ```

5. **Restart your terminal** and enjoy your new setup!

## 📁 Structure

```
~/.dotfiles/
├── aerospace/          # AeroSpace tiling window manager config
├── alacritty/          # Alacritty terminal emulator config
├── bat/                # Bat (better cat) config and themes
├── borders/            # JankyBorders window borders config
├── btop/               # Btop system monitor config
├── htop/               # Htop system monitor config
├── neofetch/           # Neofetch system info config
├── nvim/               # Neovim configuration with LazyVim
├── sketchybar/         # SketchyBar status bar configuration
├── thefuck/            # TheFuck command correction config
├── tmux/               # Tmux terminal multiplexer config
├── zsh/                # Additional Zsh scripts
├── .zshrc              # Main Zsh configuration
├── starship.toml       # Starship prompt configuration
├── setup.sh            # Installation script
└── link.sh             # Configuration linking script
```

## 🎯 Key Bindings

### AeroSpace (Tiling Window Manager)

- `Alt + T`: Open new Alacritty terminal
- `Alt + F`: Toggle fullscreen
- `Alt + ←/→/↑/↓`: Focus window in direction
- `Alt + Shift + ←/→/↑/↓`: Move window in direction
- `Alt + 1-9`: Switch to workspace
- `Alt + Shift + 1-9`: Move window to workspace
- `Alt + Shift + ;`: Enter service mode
- `Alt + /`: Toggle horizontal/vertical layout
- `Alt + ,`: Toggle accordion layout

### Service Mode (Alt + Shift + ;)
- `Esc`: Exit service mode and reload config
- `F`: Toggle floating/tiling layout
- `R`: Reset layout
- `Backspace`: Close all windows but current

## 🔧 Configuration

### SketchyBar

The SketchyBar configuration is written in Lua and includes:
- Workspace indicators with AeroSpace integration
- System information widgets (CPU, battery, WiFi)
- Media controls
- Calendar and time display
- Custom app icons and colors

### Neovim

Uses LazyVim as a base configuration with additional plugins for:
- Modern editing experience
- LSP integration
- File navigation
- Git integration
- Theme customization

### Shell Environment

Enhanced Zsh configuration includes:
- Oh My Zsh framework
- Starship prompt
- Modern CLI tool aliases
- Fuzzy finding with fzf
- Better navigation with zoxide
- Syntax highlighting and autosuggestions

## 🎨 Theming

The setup uses a cohesive Tokyo Night color scheme across all applications:
- Terminal colors
- Neovim theme
- SketchyBar colors
- Bat syntax highlighting

## 🔄 Services Management

### Start/Stop Services
```bash
# AeroSpace
brew services start/stop/restart aerospace

# SketchyBar
brew services start/stop/restart sketchybar

# JankyBorders
brew services start/stop/restart borders
```

### Reload Configurations
```bash
# AeroSpace
Alt + Shift + C (or restart service)

# SketchyBar
sketchybar --reload
```

## 🚨 Troubleshooting

### SketchyBar not starting
```bash
# Check logs
tail -f /opt/homebrew/var/log/sketchybar.log

# Restart service
brew services restart sketchybar
```

### AeroSpace not working
```bash
# Check if running
ps aux | grep aerospace

# Restart service
brew services restart aerospace
```

### Fonts not displaying correctly
```bash
# Refresh font cache
fc-cache -f -v

# Ensure Nerd Fonts are installed
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sketchybar-app-font
```

## 📦 Tools Included

### Window Management
- **AeroSpace**: Tiling window manager
- **JankyBorders**: Window borders

### Status Bar
- **SketchyBar**: Customizable status bar

### Terminal & Shell
- **Alacritty**: Terminal emulator
- **Zsh**: Shell with Oh My Zsh
- **Starship**: Shell prompt
- **Tmux**: Terminal multiplexer

### CLI Tools
- **Neovim**: Text editor
- **Bat**: Better cat with syntax highlighting
- **Eza**: Better ls with icons
- **Fzf**: Fuzzy finder
- **Fd**: Better find
- **Zoxide**: Better cd with frecency
- **Btop/Htop**: System monitors
- **Neofetch**: System information
- **TheFuck**: Command correction

## 🤝 Contributing

Feel free to fork this repository and customize it for your needs. Pull requests are welcome!

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
