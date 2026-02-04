#!/bin/bash
# Claude Code installation (homebrew version isn't auto-updated)

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    pre-link)
        if ! command -v claude &>/dev/null; then
            echo "Installing Claude Code..."
            curl -fsSL https://claude.ai/install.sh | bash
        fi
        ;;
    status)
        command -v claude &>/dev/null
        ;;
esac
