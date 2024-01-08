#!/bin/bash
set -e

# Build and install neovim
sudo apt install make cmake gcc gettext
mkdir -p ~/github
git clone https://github.com/neovim/neovim ~/github/neovim

pushd ~/github/neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    pushd build
        cpack -G DEB
        sudo dpkg -i nvim-linux64.deb
    popd
popd
