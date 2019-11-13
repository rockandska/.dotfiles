# Setup fzf
# ---------
if [[ ! "$PATH" == *${HOME}/.local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/home/rockandska/.local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.local/opt/fzf-obc/bin/fzf-obc.bash" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.local/opt/fzf/shell/key-bindings.bash"

export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'"
