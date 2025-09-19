# ────── 🔧 Tmux Aliases & Functions ──────
# Useful tmux shortcuts and functions

# Basic tmux aliases
alias t='tmux'
alias ta='tmux attach'
alias tad='tmux attach -d'
alias ts='tmux new-session'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session'

# Advanced tmux functions
# Create new session with name
tn() {
    if [ $# -eq 0 ]; then
        tmux new-session
    else
        tmux new-session -s "$1"
    fi
}

# Attach to session by name or create if doesn't exist
tc() {
    if [ $# -eq 0 ]; then
        echo "Usage: tc <session-name>"
        return 1
    fi
    
    if tmux has-session -t "$1" 2>/dev/null; then
        tmux attach-session -t "$1"
    else
        tmux new-session -s "$1"
    fi
}

# Kill session by name
tk() {
    if [ $# -eq 0 ]; then
        echo "Usage: tk <session-name>"
        tmux list-sessions
        return 1
    fi
    tmux kill-session -t "$1"
}

# Tmux session switcher with fzf (if available)
if command -v fzf >/dev/null 2>&1; then
    tsw() {
        local session
        session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --prompt="Select session: " --height=40% --reverse)
        if [[ -n "$session" ]]; then
            tmux attach-session -t "$session"
        fi
    }
fi
