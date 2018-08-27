# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

