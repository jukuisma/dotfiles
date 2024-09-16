PWD = $(shell pwd)

all: vim neovim zsh git tmux radare2
patch: patchppuccin ohmypatch airlinepatch
.PHONY: vim neovim zsh git tmux radare2 \
	patch patchppuccin ohmypatch airlinepatch

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

patchppuccin:
	cd ~/.vim/bundle/nvim/lua/catppuccin && \
		git am < ${PWD}/neovim/0001-Patch-mocha-background.patch || \
		git am --abort

ohmypatch:
	cd ~/.oh-my-zsh && \
		git am < ${PWD}/zsh/0001-Disable-automatic-updates.patch || \
		git am --abort

airlinepatch:
	cd ~/.vim/bundle/vim-airline && \
		git am < ${PWD}/neovim/0002-Patch-UTF-8-symbols.patch || \
		git am --abort

fortunes:
	gpg -d radare2/fortunes.gpg >> ~/github/radare2/doc/fortunes.fun
