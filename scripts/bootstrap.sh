#!/bin/bash
set -e

REPO="https://github.com/clutchski/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"

echo ""
echo "==> Cloning dotfiles"
echo ""
echo "    Repository: $REPO"
echo "    Target:     $DOTFILES_DIR"
echo ""

if [ -d "$DOTFILES_DIR" ]; then
    echo "    Pulling latest..."
    git -C "$DOTFILES_DIR" pull --quiet
else
    echo "    Cloning..."
    git clone --quiet "$REPO" "$DOTFILES_DIR"
fi

echo "    Done"

curl -fsSL https://raw.githubusercontent.com/clutchski/dottie/main/scripts/install.sh | bash

echo ""
echo "==> Running dottie"
echo ""

cd "$DOTFILES_DIR"
dottie run
