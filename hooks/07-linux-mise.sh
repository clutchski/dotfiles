#!/bin/bash
# Mise installation (Linux only)

# Only run on Linux
[[ "$(uname)" == "Linux" ]] || exit 0

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    pre-link)
        if ! command -v mise &>/dev/null; then
            curl https://mise.run | sh
        fi
        ;;
    post-link)
        cd "$DOTTIE_ROOT" || exit 1
        mise trust
        mise install
        ;;
    status)
        command -v mise &>/dev/null || exit 1
        ;;
esac
