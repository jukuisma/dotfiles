vim:
	cp vim/vimrc ~/.vimrc

nvim: vim
	mkdir -p ~/.config/nvim
	cp vim/init.vim ~/.config/nvim/

zsh:
	cp zsh/zshrc ~/.zshrc

git:
	cp git/gitconfig ~/.gitconfig

.PHONY: vim nvim zsh git
all: vim nvim zsh git
