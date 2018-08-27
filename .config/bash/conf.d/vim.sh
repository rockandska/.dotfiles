# Set vimrc's location and source it on vim startup
export VIMINIT='let $MYVIMRC="'${XDG_CONFIG_HOME:-${HOME}/.config}'/vim/vimrc" | source $MYVIMRC'
