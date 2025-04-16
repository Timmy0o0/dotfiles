#!/bin/bash

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: Please install GNU Stow first"
    exit 1
fi

# Make sure ~/.config exists
mkdir -p ~/.config

# Create symbolic links
echo "Creating symbolic links..."

echo "Linking nvim and nix folders..."
ln -snf ~/dotfiles/.config/nvim ~/.config/
ln -snf ~/dotfiles/.config/nix ~/.config/

echo "Symbolic links created successfully!"
