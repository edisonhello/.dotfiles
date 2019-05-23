#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export TERM=xterm-256color
export VISUAL=vim
export EDITOR="$VISUAL"

alias cp='cp -i'
alias mv='mv -i'
alias jizz='sudo -s'
alias weather='curl -4 wttr.in/Taipei'
alias g++S='g++ -W -Wall -Wextra -O2 -DWEAK -std=c++17 -fsanitize=address -fsanitize=undefined -fsanitize=leak'
alias g++D='g++ -W -Wall -Wextra -O2 -DWEAK -std=c++17'
alias g++='g++ -W -Wall -Wextra -O2 -std=c++17'
alias tmux='tmux -2'
alias ctpl='cp ~/Coding/cpp/template/template.cpp'
alias dcj='~/dcj_tool/dcj.sh'
alias rclone='rclone -vvvv'

alias open='xdg-open'

source $HOME/Coding/.dotfiles/.bash-powerline.sh

cvim(){
    if [ -f "$1" ]
    then
        vim -c "/main(){" "$1"
    else
        ctpl "$1"
        vim -c "/main(){" "$1"
    fi
}
