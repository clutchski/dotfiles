#!/bin/bash
# Git configuration

case "$1" in
    post-link)
        if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
            echo "[dry-run] would configure git"
        else
            git config --global core.excludesfile ~/.gitignore
            if [[ "$(hostname)" == bt* ]]; then
                git config --global user.email "matt@braintrustdata.com"
            fi
        fi
        ;;
esac
