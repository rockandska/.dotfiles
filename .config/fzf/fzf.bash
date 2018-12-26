# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rockandska/.local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/home/rockandska/.local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/rockandska/.local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/rockandska/.local/opt/fzf/shell/key-bindings.bash"

