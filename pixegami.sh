#!/bin/bash

# Update the system and install essential tools
echo "Updating system and installing essential tools..."
sudo yum update -y
sudo yum install -y git curl gcc-c++ cmake

# Install neovim
echo "Installing neovim..."
sudo yum install -y neovim

# Setup vim-plug for neovim
echo "Setting up vim-plug for neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Check if the neovim config directory exists, if not, create it
NVIM_CONFIG_DIR="$HOME/.config/nvim"
if [ ! -d "$NVIM_CONFIG_DIR" ]; then
    echo "Creating neovim config directory..."
    mkdir -p "$NVIM_CONFIG_DIR"
fi

# Create an init.vim if it doesn't exist and add some basic configurations
INIT_VIM_PATH="$NVIM_CONFIG_DIR/init.vim"
if [ ! -f "$INIT_VIM_PATH" ]; then
    echo "Creating init.vim and adding basic configurations..."
    cat > "$INIT_VIM_PATH" << EOF
call plug#begin('~/.local/share/nvim/plugged')

" Example plugin: NERDTree, a file system explorer
Plug 'preservim/nerdtree'

call plug#end()

" Basic settings for a better editing experience
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set noerrorbells
EOF
fi

echo "Installation and setup completed. Launch neovim and run ':PlugInstall' to install plugins."
