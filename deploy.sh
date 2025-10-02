#!/bin/bash

set -e

# First install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Cloning oh-myzsh"
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Deploy each app config file.
for f in `ls . `
do
    if [[ $f == "README.md" ]] || [[ $f == "deploy.sh" ]] || [[  $f == "Brewfile" ]]; then
        continue
    fi

    # symlink instead?
    if [ -d $f ]; then
        mkdir -p ~/.${f}
        cp -f -r ${f}/* ~/.${f}
    else
        rm -f ~/.${f} # handles overwriting symlinks
        cp -f $f ~/.${f}
    fi
done

# Check if the Brewfile needs to be applied
if ! brew bundle check > /dev/null ; then
  echo "📦 Installing missing packages from Brewfile..."
  brew bundle
fi

# Setup vim.
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim +'PlugInstall --sync' +qa

# Set up git.
git config --global core.excludesfile ~/.gitignore

if [[ "$(hostname)" == bt* ]]; then
    git config --global user.email "matt@braintrustdata.com"
fi
