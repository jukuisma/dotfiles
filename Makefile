PWD = $(shell pwd)
SOFTWARE = vim neovim htop strace xxd tree make gcc gdb fzf fd-find ripgrep fish

all: vim neovim fish git tmux radare2 gdb alacritty bin plugins patch
patch: patchppuccin airlinepatch
.PHONY: vim neovim fish git tmux radare2 gdb alacritty bin \
	plugins patch patchppuccin airlinepatch

vim:
	cp vim/vimrc ~/.vimrc

neovim:
	cp neovim/nvimrc ~/.nvimrc
	mkdir -p ~/.config/nvim
	cp neovim/init.vim ~/.config/nvim/

fish:
	cp fish/* ~/.config/fish/conf.d/

git:
	cp git/gitconfig ~/.gitconfig

tmux:
	cp tmux/tmux.conf ~/.tmux.conf

radare2:
	cp radare2/radare2rc ~/.radare2rc

gdb:
	cp gdb/gdbinit ~/.gdbinit

alacritty:
	mkdir -p ~/.config/alacritty/
	cp alacritty/* ~/.config/alacritty/

bin:
	mkdir -p ~/.local/bin/
	cp bin/* ~/.local/bin/

plugins:
	git clone --depth=1 \
		https://github.com/VundleVim/Vundle.vim.git \
		~/.vim/bundle/Vundle.vim || true
	nvim -c 'PluginInstall' -c 'qa'

patchppuccin:
	cd ~/.vim/bundle/nvim/lua/catppuccin && \
		git am < ${PWD}/neovim/0001-Patch-mocha-background.patch || \
		git am --abort

airlinepatch:
	cd ~/.vim/bundle/vim-airline && \
		git am < ${PWD}/neovim/0002-Patch-UTF-8-symbols.patch || \
		git am --abort

debian:
	sudo apt-get -y install ${SOFTWARE}

fedora:
	sudo dnf -y install ${SOFTWARE}

fortunes:
	gpg -d radare2/fortunes.gpg >> ~/github/radare2/doc/fortunes.fun
