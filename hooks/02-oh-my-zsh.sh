#!/bin/bash
# Oh My Zsh installation

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    pre-link)
        if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
            echo "Cloning oh-my-zsh..."
            rm -rf ~/.oh-my-zsh
            git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        fi
        ;;
    status)
        [ -f ~/.oh-my-zsh/oh-my-zsh.sh ]
        ;;
esac
