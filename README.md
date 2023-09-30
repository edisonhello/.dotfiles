How to use this:

```bash
git clone --bare https://github.com/edisonhello/.dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles submodule update --init
dotfiles checkout
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
