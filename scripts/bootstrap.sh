#!/bin/bash
set -e

REPO="https://github.com/clutchski/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"

echo ""
echo "    .___      __    __  .__        "
echo "  __| _/_____/  |__/  |_|__| ____  "
echo " / __ |/  _ \   __\   __\  |/ __ \ "
echo "/ /_/ (  <_> )  |  |  | |  \  ___/ "
echo "\____ |\____/|__|  |__| |__|\___  >"
echo "     \/                         \/ "
echo ""
echo "        Bootstrapping your dotfiles..."
echo ""

echo "==> Cloning dotfiles"
echo ""
echo "    Repository: $REPO"
echo "    Target:     $DOTFILES_DIR"

if [ -d "$DOTFILES_DIR" ]; then
    git -C "$DOTFILES_DIR" pull --quiet
else
    git clone --quiet "$REPO" "$DOTFILES_DIR"
fi

curl -fsSL https://raw.githubusercontent.com/clutchski/dottie/main/scripts/install.sh | bash

echo "==> Running dottie"
echo ""

cd "$DOTFILES_DIR"
dottie run
