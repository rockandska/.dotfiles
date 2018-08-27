# https://raw.githubusercontent.com/l0b0/xterm-color-count/master/xterm-color-count.sh

# First, test if terminal supports OSC 4 at all.
printf '\e]4;%d;?\a' 0
read -d $'\a' -s -t 0.1 </dev/tty
if [ -z "$REPLY" ];then
    # OSC 4 not supported, so we'll fall back to terminfo
    max=$(tput colors)
else
    # OSC 4 is supported, so use it for a binary search
    min=0
    max=256
    while [[ $((min+1)) -lt $max ]];do
        i=$(( (min+max)/2 ))
        printf '\e]4;%d;?\a' $i
        read -d $'\a' -s -t 0.1 </dev/tty
        if [ -z "$REPLY" ];then
            max=$i
        else
            min=$i
        fi
    done
fi

if [[ "$TERM" != "linux" ]];then
    if [[ $max -eq 256 ]];then
        case "$TERM" in
            xterm|terminator|xfce4-terminal) TERM=xterm-256color;;
            rxvt|Eterm) TERM=rxvt-256color;;
            mrxvt) TERM=mrxvt-256color;;
            gnome-terminal) TERM=gnome-256color;;
            putty|pterm) TERM=putty-256color;;
            GNU|screen|tmux) TERM=screen-256color;;
        esac
    fi
fi
