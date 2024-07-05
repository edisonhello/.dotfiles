How to use this:

```bash
git clone --bare https://github.com/edisonhello/.dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles submodule update --init
dotfiles checkout
```

To install on AWS:

```bash
mv $HOME/.ssh/authorized_keys $HOME/.ssh/authorized_keys.bak
git clone --bare https://github.com/edisonhello/.dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles submodule update --init
rm $HOME/.bashrc
dotfiles checkout
cat $HOME/.ssh/authorized_keys.bak >> $HOME/.ssh/authorized_keys

sudo apt install -y htop tmux nodejs clang-format clangd fzf ripgrep
sudo snap install nvim --classic
nvim -c 'PlugInstall' -c 'qa'

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install 22
nvm alias default 22
nvm use 22
```

In nvim:

```
:CocInstall coc-clangd
```

## Dependencies

* tmux
* neovim
        * fzf
                * rg (ripgrep)
* node
* clang-format
* clangd

To install these:

```
sudo apt install neovim htop tmux nodejs clang-format clangd fzf ripgrep
```

## TODO

* Maybe ctrlp is overlap with fzf?
