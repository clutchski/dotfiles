#!/bin/bash
# Git configuration

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    post-link)
        if [[ "$(hostname)" == bt* ]]; then
            git config --global user.email "matt@braintrustdata.com"
        fi
        ;;
esac
