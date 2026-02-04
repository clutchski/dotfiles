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

echo "    Dotfiles:  $REPO"
echo "    Target:    $DOTFILES_DIR"
echo "    Platform:  $(uname -s)/$(uname -m)"
echo ""

if [ -d "$DOTFILES_DIR" ]; then
    git -C "$DOTFILES_DIR" pull --quiet
else
    git clone --quiet "$REPO" "$DOTFILES_DIR"
fi

curl -fsSL https://raw.githubusercontent.com/clutchski/dottie/main/scripts/install.sh | QUIET=1 bash

DOTTIE_VERSION=$(dottie version 2>/dev/null | head -1 | awk '{print $2}')
echo "    Dottie:    ${DOTTIE_VERSION:-latest}"
echo ""

cd "$DOTFILES_DIR"
dottie run

echo ""
echo "    Done. Your dotfiles are ready."
echo ""
echo "    Next time: cd $DOTFILES_DIR && dottie run"
echo ""
