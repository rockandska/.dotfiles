# append to the history file, don't overwrite it
shopt -s histappend
# Maximum number of history lines in memory
export HISTSIZE=50000
# Maximum number of history lines on disk
export HISTFILESIZE=50000
# Ignore duplicate lines
export HISTCONTROL=ignoredups:erasedups
# Add timestamp
HISTTIMEFORMAT="%d/%m/%y %T "
# After each command, append to the history file 
# and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
