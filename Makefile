PWD = $(shell pwd)
USER = $(shell whoami)

SW_COMMON = vim neovim htop strace tree make gcc gdb \
	    fzf fd-find ripgrep fish wget curl bat
SW_DEBIAN = ${SW_COMMON} xxd universal-ctags
SW_FEDORA = ${SW_COMMON} xxd ctags
SW_RHEL = ${SW_COMMON} util-linux-user ctags

all: vim neovim fish chsh git tmux radare2 gdb alacritty bin bat plugins patch
patch: patchppuccin airlinepatch

.PHONY: vim neovim fish chsh git tmux dconf radare2 gdb alacritty bin bat \
	plugins patch patchppuccin airlinepatch \
	debian fedora rhel

vim:
	cp vim/vimrc ~/.vimrc

neovim:
	cp neovim/nvimrc ~/.nvimrc
	mkdir -p ~/.config/nvim
	cp neovim/init.vim ~/.config/nvim/

fish:
	mkdir -p ~/.config/fish/conf.d/
	cp fish/* ~/.config/fish/conf.d/

chsh:
	sudo chsh -s /usr/bin/fish ${USER}

git:
	cp git/gitconfig ~/.gitconfig

tmux:
	cp tmux/tmux.conf ~/.tmux.conf

dconf:
	cat dconf/keybindings | \
		dconf load /org/gnome/desktop/wm/keybindings/
	cat dconf/media-keys | \
		dconf load /org/gnome/settings-daemon/plugins/media-keys/

radare2:
	cp radare2/radare2rc ~/.radare2rc

gdb:
	cp gdb/gdbinit ~/.gdbinit
	cp gdb/gdbearlyinit ~/.gdbearlyinit

alacritty:
	mkdir -p ~/.config/alacritty/
	cp alacritty/* ~/.config/alacritty/

bin:
	mkdir -p ~/.local/bin/
	cp bin/* ~/.local/bin/

bat:
	mkdir -p ~/.config/bat/themes/
	wget -nc -P \
		~/.config/bat/themes/ \
		https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
	cp bat/config ~/.config/bat/
	bat cache --build || batcat cache --build

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
	sudo apt-get -y install ${SW_DEBIAN}
	mkdir -p ~/.local/bin
	ln -sf /usr/bin/batcat ~/.local/bin/bat
	ln -sf /usr/bin/fdfind ~/.local/bin/fd

fedora:
	sudo dnf -y install ${SW_FEDORA}

rhel:
	sudo dnf -y install epel-release
	sudo dnf -y install ${SW_RHEL}

fortunes:
	gpg -d radare2/fortunes.gpg >> ~/github/radare2/doc/fortunes.fun
