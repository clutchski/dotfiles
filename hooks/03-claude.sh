#!/bin/bash
# Claude Code installation (homebrew version isn't auto-updated)

case "$1" in
    pre-link)
        if ! command -v claude &>/dev/null; then
            if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
                echo "[dry-run] would install Claude Code"
            else
                echo "Installing Claude Code..."
                curl -fsSL https://claude.ai/install.sh | bash
            fi
        fi
        ;;
    status)
        command -v claude &>/dev/null
        ;;
esac
