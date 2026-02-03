#!/bin/bash
# Oh My Zsh installation

case "$1" in
    pre-link)
        if [ ! -d ~/.oh-my-zsh ]; then
            if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
                echo "[dry-run] would clone oh-my-zsh"
            else
                echo "Cloning oh-my-zsh..."
                git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
            fi
        fi
        ;;
    status)
        [ -d ~/.oh-my-zsh ]
        ;;
esac
