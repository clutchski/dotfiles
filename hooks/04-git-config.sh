#!/bin/bash
# Git configuration - write local gitconfig with the right email per machine

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

LOCAL_CONFIG="$HOME/.local.gitconfig"

WORK="bWF0dEBicmFpbnRydXN0ZGF0YS5jb20="
HOME="Y2x1dGNoc2tpQGdtYWlsLmNvbQ=="

if [[ "$(hostname)" == bt* ]]; then
    RAW="$WORK"
else
    RAW="$HOME"
fi
EMAIL=$(echo "$RAW" | base64 -d)

case "$1" in
    post-link)
        printf '[user]\n    email = %s\n' "$EMAIL" > "$LOCAL_CONFIG"
        ;;
    status)
        [[ -f "$LOCAL_CONFIG" ]] && grep -q "$EMAIL" "$LOCAL_CONFIG"
        ;;
esac
