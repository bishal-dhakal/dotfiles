# =============================================================================
# ZSH CORE
# =============================================================================

export ZSH="$HOME/.oh-my-zsh"

# Use limited random themes to avoid broken ones
# Selected themes: clean, modern, and well-maintained
ZSH_THEME_RANDOM_CANDIDATES=(
  robbyrussell    # Classic, minimal, fast
  agnoster        # Powerline-style, informative
  bira            # Clean with git info
  af-magic        # Fast, colorful, git-aware
  amuse           # Modern, clean, git status
  arrow           # Simple, arrow-based
  bureau          # Clean, informative
  cloud           # Minimal cloud theme
  crunch          # Compact, informative
  fino            # Modern, git-aware
  gallifrey       # Doctor Who inspired, clean
  gentoo          # Clean, simple
  jaischeema      # Modern, colorful
  josh            # Minimal, fast
  lambda          # Lambda symbol, clean
  macos           # macOS style
  miloshadzic     # Clean, informative
  minimal         # Ultra minimal
  nanotech        # Tech-inspired, clean
  pure            # Inspired by Pure prompt
  refined         # Refined, modern
  risto           # Clean, git-aware
  sammy           # Simple, fast
  steeef          # Clean, informative
  sunrise         # Colorful, git-aware
  terminalparty   # Party theme, fun
  theunraveler    # Clean, modern
  wezm            # Minimal, fast
  xiong-chiamiov  # Clean, informative
  ys              # YS theme, popular
)
ZSH_THEME="random"

# =============================================================================
# EDITOR / TOOLING (exported before PATH to use in PATH)
# =============================================================================

export MASON="$HOME/.local/share/nvim/mason"
export NARGO_HOME="$HOME/.nargo"
export ZKSYNC_HOME="$HOME/projects/web3/zksync-era"

# =============================================================================
# PATH (Zsh-native, clean & dynamic)
# =============================================================================

typeset -U path PATH

path=(
  /opt/homebrew/bin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin

  $HOME/bin
  $HOME/.local/bin
  $HOME/.serverless/bin
  $HOME/.spicetify/bin
  $HOME/.foundry/bin
  $HOME/.rvm/bin
  $NARGO_HOME/bin

  $ZKSYNC_HOME/bin
)

# Add Python bin directories dynamically (if they exist)
[ -d "$HOME/Library/Python/3.12/bin" ] && path+=("$HOME/Library/Python/3.12/bin")

export PATH

# =============================================================================
# OH-MY-ZSH PLUGINS (optimized)
# =============================================================================

plugins=(
  git
  fzf
  kubectl
  kubectx
  ansible
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
)

source "$ZSH/oh-my-zsh.sh"

# =============================================================================
# NODE / JAVA / SDK MANAGERS
# =============================================================================

# ---- NVM (guarded) ----
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  source "/opt/homebrew/opt/nvm/nvm.sh"
fi

# ---- SDKMAN (MUST be at end of block) ----
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# =============================================================================
# COMPLETION & BASH COMPAT
# =============================================================================

autoload -U +X bashcompinit && bashcompinit

# Terraform completion (guarded)
command -v terraform >/dev/null && \
  complete -o nospace -C /opt/homebrew/bin/terraform terraform

# =============================================================================
# ALIASES
# =============================================================================

alias vim="nvim"
alias cat="bat"
alias ls="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions"

# zoxide (keep cd intact for scripts)
alias zc="z"

# =============================================================================
# FZF (guarded & themed)
# =============================================================================

if command -v fzf >/dev/null; then
  eval "$(fzf --zsh)"
fi

# ---- FZF THEME ----
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# Use fd for fzf if available
if command -v fd >/dev/null; then
  export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
fi

# Preview helpers
show_file_or_dir_preview='
if [ -d {} ]; then
  eza --tree --color=always {} | head -200
else
  bat -n --color=always --line-range :500 {}
fi
'

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'" "$@" ;;
    ssh)          fzf --preview 'dig {}' "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# =============================================================================
# BAT / EZA / ZOXIDE
# =============================================================================

export BAT_THEME="tokyonight_night"

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

# =============================================================================
# NNN FILE MANAGER
# =============================================================================

export NNN_TMPFILE="$HOME/.config/nnn/.lastd"
export NNN_OPTS="AdHoU"
export NNN_FCOLORS="c1e2272e006033f7c6d6abc4"

# =============================================================================
# GIT CONFIGURATION
# =============================================================================

# Enable git credential caching (without timeout - uses default 15 minutes)
git config --global credential.helper cache 2>/dev/null || true

# =============================================================================
# OPTIONAL: STARSHIP (disabled)
# =============================================================================
# eval "$(starship init zsh)"

# Added by Antigravity
[ -d "$HOME/.antigravity/antigravity/bin" ] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
