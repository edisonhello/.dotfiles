How to use this:

```
$ git clone --bare https://github.com/edisonhello/.dotfiles.git $HOME/.dotfiles
$ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ dotfiles submodule update --init
$ dotfiles checkout
```
