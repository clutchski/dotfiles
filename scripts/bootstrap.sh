#!/bin/bash
set -e

REPO="https://github.com/clutchski/dotfiles"

git clone "$REPO" ~/.dotfiles
cd ~/.dotfiles

curl -fsSL https://raw.githubusercontent.com/clutchski/dottie/main/scripts/install.sh | bash

dottie run
