PWD = $(shell pwd)

all: vim neovim zsh git tmux radare2 gdb
patch: patchppuccin airlinepatch
.PHONY: vim neovim zsh git tmux radare2 gdb \
	plugins patch patchppuccin airlinepatch

vim:
	cp vim/vimrc ~/.vimrc

neovim:
	cp neovim/nvimrc ~/.nvimrc
	mkdir -p ~/.config/nvim
	cp neovim/init.vim ~/.config/nvim/

zsh:
	cp zsh/zshrc ~/.zshrc

git:
	cp git/gitconfig ~/.gitconfig

tmux:
	cp tmux/tmux.conf ~/.tmux.conf
	mkdir -p ~/.local/bin/
	cp tmux/tmux-sessionizer ~/.local/bin/

radare2:
	cp radare2/radare2rc ~/.radare2rc

gdb:
	cp gdb/gdbinit ~/.gdbinit

plugins:
	git clone --depth=1 \
		https://github.com/VundleVim/Vundle.vim.git \
		~/.vim/bundle/Vundle.vim || true
	git clone --depth=1 \
		https://github.com/ohmyzsh/ohmyzsh.git \
		~/.oh-my-zsh || true
	git clone --depth=1 \
		https://github.com/zsh-users/zsh-autosuggestions \
		~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || true
	nvim -c 'PluginInstall' -c 'qa'

patchppuccin:
	cd ~/.vim/bundle/nvim/lua/catppuccin && \
		git am < ${PWD}/neovim/0001-Patch-mocha-background.patch || \
		git am --abort

airlinepatch:
	cd ~/.vim/bundle/vim-airline && \
		git am < ${PWD}/neovim/0002-Patch-UTF-8-symbols.patch || \
		git am --abort

fortunes:
	gpg -d radare2/fortunes.gpg >> ~/github/radare2/doc/fortunes.fun
