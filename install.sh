#!/bin/bash

set -x
set -e

TMP_DIR=/tmp

# Build and install neovim (https://github.com/neovim/neovim/wiki/Building-Neovim)

sudo apt-get install ninja-build gettext cmake unzip curl

cd $TMP_DIR
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
make
sudo make install

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install neovim configurations
git clone https://github.com/gu1lhermelp/nvim.git ~/.config/nvim

# Install font
# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf

