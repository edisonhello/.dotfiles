#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Autojump
[[ -s /home/edison/.autojump/etc/profile.d/autojump.sh ]] && source /home/edison/.autojump/etc/profile.d/autojump.sh
source $HOME/.bash-powerline.sh

alias ls='ls --color=auto'
alias cp='cp -i'
alias mv='mv -i'

PS1='[\u@\h \W]\$ '

export TERM=xterm-256color
export VISUAL=vim
export EDITOR="$VISUAL"

export HISTSIZE=10000

alias weather='curl -4 wttr.in/Taipei'
alias g++S='g++ -W -Wall -Wextra -Wpedantic -O2 -DWEAK -g -std=c++17 -fsanitize=address -fsanitize=undefined -fsanitize=leak'
alias g++D='g++ -W -Wall -Wextra -Wpedantic -O2 -DWEAK -std=c++17'
alias g+++='g++ -W -Wall -Wextra -Wpedantic -O2 -std=c++17'
alias tmux='tmux -2'
alias ctpl='cp ~/Coding/cpp/template/template.cpp'
# alias dcj='~/dcj_tool/dcj.sh'
# alias rclone='rclone -vvvv'

alias open='xdg-open'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export FZF_DEFAULT_COMMAND="find -L"


cvim() {
    if [ -f "$1" ] 
	then
        vim -c "/main(){" "$1"
    else
        ctpl "$1"
        vim -c "/main(){" "$1"
    fi
}

pandocmdpdf() {
	inputf=$1
	shift
	outputf=$(echo $inputf | sed 's/\.md/\.pdf/')
	echo "Compiling $inputf to $outputf"
	pandoc --pdf-engine=xelatex --variable geometry="margin=0.5in" -s -f markdown $inputf -o $outputf $@
}

clip(){
    if [ -f "$1" ]
    then
        cat "$1" | xclip -selection clipboard
    else
        echo "What do you want to copy? There's no such file."
    fi
}
