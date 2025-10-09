PWD = $(shell pwd)
USER = $(shell whoami)

SW_COMMON = vim neovim htop strace tree make gcc gdb \
	    fzf fd-find ripgrep fish wget curl bat
SW_DEBIAN = ${SW_COMMON} xxd universal-ctags
SW_FEDORA = ${SW_COMMON} xxd ctags diff-so-fancy
SW_RHEL = ${SW_COMMON} util-linux-user ctags diff-so-fancy

all: vim neovim fish chsh git tmux radare2 gdb alacritty bin bat

.PHONY: vim neovim fish chsh git tmux dconf radare2 gdb alacritty bin share \
	bat gpg debian fedora rhel nixos

vim:
	cp vim/vimrc ~/.vimrc

neovim:
	cp neovim/nvimrc ~/.nvimrc
	mkdir -p ~/.config/nvim
	cp neovim/init.vim ~/.config/nvim/
	cp neovim/plugins.vim ~/.config/nvim/

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
	cat dconf/character-repeat-speed | \
		dconf load /org/gnome/desktop/peripherals/keyboard/
	cat dconf/desktop-interface | \
		dconf load /org/gnome/desktop/interface/
	cat dconf/app-switcher | \
		dconf load /org/gnome/shell/app/switcher/
	cat dconf/mutter | \
		dconf load /org/gnome/mutter/

radare2:
	cp radare2/radare2rc ~/.radare2rc

gdb:
	cp gdb/gdbinit ~/.gdbinit
	cp gdb/gdbearlyinit ~/.gdbearlyinit

alacritty:
	mkdir -p ~/.config/alacritty/
	cp alacritty/* ~/.config/alacritty/

bin: share
	mkdir -p ~/.local/bin/
	cp bin/* ~/.local/bin/

share:
	mkdir -p ~/.local/share/debian/
	cp share/debian/* ~/.local/share/debian/

bat:
	mkdir -p ~/.config/bat/themes/
	wget -nc -P \
		~/.config/bat/themes/ \
		https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
	cp bat/config ~/.config/bat/
	bat cache --build || batcat cache --build

gpg:
	cp gpg/gpg.conf ~/.gnupg/gpg.conf

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

nixos: all
	sudo nixos-rebuild switch --upgrade
