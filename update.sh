#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGES=(shell git vim ssh python screen mise worktrunk iterm oh-my-zsh claude)

cd "$DOTFILES_DIR"

for pkg in "${PACKAGES[@]}"; do
    stow -t ~ -R "$pkg"
done
