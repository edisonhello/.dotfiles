#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Windows transparent
# if [ -n "$WINDOWID" ]; then
#     TRANSPARENCY_HEX=$(printf 0x%x $((0xffffffff * 80 / 100)))
#     xprop -id "$WINDOWID" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$TRANSPARENCY_HEX"
# fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TERM=xterm-256color
export VISUAL=vim
export EDITOR="$VISUAL"

alias cp='cp -i'
alias mv='mv -i'
alias jizz='sudo -s'
alias node_debug='DEBUG=* node'
alias weather='curl -4 wttr.in/Taipei'
alias qwertyuiop='poweroff'
alias g++S='g++ -W -Wall -Wextra -O2 -DWEAK -std=c++14 -fsanitize=address -fsanitize=undefined -fsanitize=leak'
alias g++D='g++ -W -Wall -Wextra -O2 -DWEAK -std=c++14'
alias g+++='g++ -W -Wall -Wextra -O2 -std=c++14'
alias g++98='g++ -W -Wall -Wextra -O2 -std=c++98'
alias tmux='tmux -2'
alias ctpl='cp ~/Coding/cpp/template/template.cpp'
alias dcj='~/dcj_tool/dcj.sh'

alias open='xdg-open'

alias codeforces='DEBUG=* codeforces'


if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi
source $HOME/.bash-powerline.sh

cvim(){
    if [ -f "$1" ]
    then
        vim -c "/main(){" "$1"
    else
        ctpl "$1"
        vim -c "/main(){" "$1"
    fi
}
clip(){
    if [ -f "$1" ]
    then
        cat "$1" | xclip -selection clipboard
    else
        echo "What do you want to copy? There's no such file."
    fi
}

