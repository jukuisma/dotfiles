PWD = $(shell pwd)

vim:
	cp vim/vimrc ~/.vimrc

nvim: vim
	mkdir -p ~/.config/nvim
	cp vim/init.vim ~/.config/nvim/

zsh:
	cp zsh/zshrc ~/.zshrc

git:
	cp git/gitconfig ~/.gitconfig

tmux:
	cp tmux/tmux.conf ~/.tmux.conf

patchppuccin:
	# Patch mocha background until all confs are migrated to lua and it can
	# be properly overridden.
	cd ~/.vim/bundle/nvim/lua/catppuccin && \
		git am < ${PWD}/vim/0001-Patch-mocha-background.patch || \
		git am --abort

ohmypatch:
	# Patch oh my zsh to not automatically check for updates during each
	# initial load.
	cd ~/.oh-my-zsh && \
		git am < ${PWD}/zsh/0001-Disable-automatic-updates.patch || \
		git am --abort

.PHONY: vim nvim zsh git tmux patchppuccin ohmypatch
all: vim nvim zsh git tmux
