#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Autojump
[[ -s /home/edison/.autojump/etc/profile.d/autojump.sh ]] && source /home/edison/.autojump/etc/profile.d/autojump.sh

source $HOME/.bash-powerline.sh
source $HOME/.git-completion.bash

alias ls='ls --color=auto'
alias cp='cp -i'
alias mv='mv -i'

PS1='[\u@\h \W]\$ '

export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"

export HISTSIZE=10000

alias weather='curl -4 wttr.in/Taipei'
alias g++S='g++ -W -Wall -Wextra -Wpedantic -O2 -g -DWEAK -std=c++20 -fsanitize=address -fsanitize=undefined -fsanitize=leak'
alias g++D='g++ -W -Wall -Wextra -Wpedantic -O2 -g -DWEAK -std=c++20'
alias g+++='g++ -W -Wall -Wextra -Wpedantic -O2 -g -std=c++20'
alias tmux='tmux -2'
alias ctpl='cp ~/Coding/cpp/template/template.cpp'
# alias dcj='~/dcj_tool/dcj.sh'
# alias rclone='rclone -vvvv'

alias ntu='cd ~/NTU/Spring2021'

alias open='xdg-open'
alias reset-keyboard-repeat='xset r rate 220 30'

alias dfs='dotfiles'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias check_80width='grep ".\{81,\}" * -r'

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

share_file() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
	echo ""
}

alias share=share_file

PATH=$HOME/bin:$PATH
PATH=$HOME/Scripts:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/bin/depot_tools:$PATH # for Google work

# nvm settings
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -r "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# pyenv settings
export PATH="/home/edison/.pyenv/bin:$PATH"
if which pyenv > /dev/null 2>&1;
    then eval "$(pyenv init -)";
fi
if which pyenv-virtualenv-init > /dev/null 2>&1;
    then eval "$(pyenv virtualenv-init -)";
fi

# spring settings
export SPRING_HOME=$HOME/libs/spring-2.3.3.RELEASE
PATH=$HOME/libs/spring-2.3.3.RELEASE/bin:$PATH

# volta settings
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# deno settings
export DENO_INSTALL="/home/edison/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# set bash to vim mode
set -o vi

# cargo settings
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
