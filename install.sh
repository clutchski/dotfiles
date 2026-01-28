#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew packages (includes stow)
if ! brew bundle check --file="$DOTFILES_DIR/Brewfile" > /dev/null 2>&1; then
    brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

# Install oh-my-zsh if needed
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Stow all packages
"$DOTFILES_DIR/update.sh"

# Install vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim +'PlugInstall --sync' +qa

# Configure git
git config --global core.excludesfile ~/.gitignore

if [[ "$(hostname)" == bt* ]]; then
    git config --global user.email "matt@braintrustdata.com"
fi
