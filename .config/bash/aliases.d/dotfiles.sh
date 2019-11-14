alias dotfiles="/usr/bin/env git --git-dir=\$HOME/.local/opt/dotfiles/.git --work-tree=\$HOME"
# Load git completion to use the same one for dotfiles
eval "$(complete | grep -- ' -D' | grep -o -- '-F [a-zA-Z_-]* ' | sed 's/-F //;s/ $//') git"
eval "$(complete | grep ' git$' | sed 's/ git$/ dotfiles'/)"
