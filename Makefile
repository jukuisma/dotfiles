PWD = $(shell pwd)

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

patch: patchppuccin ohmypatch airlinepatch

patchppuccin:
	# Patch mocha background until all confs are migrated to lua and it can
	# be properly overridden.
	cd ~/.vim/bundle/nvim/lua/catppuccin && \
		git am < ${PWD}/neovim/0001-Patch-mocha-background.patch || \
		git am --abort

ohmypatch:
	# Patch oh my zsh to not automatically check for updates during each
	# initial load.
	cd ~/.oh-my-zsh && \
		git am < ${PWD}/zsh/0001-Disable-automatic-updates.patch || \
		git am --abort

airlinepatch:
	# Patch airline statusline UTF-8 symbols
	cd ~/.vim/bundle/vim-airline && \
		git am < ${PWD}/neovim/0002-Patch-UTF-8-symbols.patch || \
		git am --abort

.PHONY: vim neovim zsh git tmux patch patchppuccin ohmypatch airlinepatch
all: vim neovim zsh git tmux
