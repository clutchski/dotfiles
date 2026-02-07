#!/bin/bash
# Mise installation and tool management (cross-platform)

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    pre-link)
        # On Linux, install mise if missing (macOS gets it via Homebrew)
        if [[ "$(uname)" == "Linux" ]] && ! command -v mise &>/dev/null; then
            curl https://mise.run | sh
        fi
        ;;
    post-link)
        if command -v mise &>/dev/null; then
            cd "$DOTTIE_ROOT" || exit 1
            mise trust -q 2>/dev/null
            if mise ls --missing 2>/dev/null | grep -q .; then
                mise install
            fi
        fi
        ;;
    status)
        command -v mise &>/dev/null || exit 1
        cd "$DOTTIE_ROOT" || exit 1
        mise ls --missing 2>/dev/null | grep -q . && exit 1
        exit 0
        ;;
esac
