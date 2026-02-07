#!/bin/bash
# Homebrew installation and package management (macOS only)

# Only run on macOS
[[ "$(uname)" == "Darwin" ]] || exit 0

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    pre-link)
        # Install Homebrew if missing
        if ! command -v brew &>/dev/null; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi

        # Install packages from Brewfile
        BREWFILE="$DOTTIE_ROOT/Brewfile"
        if [[ -f "$BREWFILE" ]] && command -v brew &>/dev/null; then
            brew bundle check --file="$BREWFILE" &>/dev/null || brew bundle --file="$BREWFILE"
        fi
        ;;
    status)
        # Fail if brew not installed
        command -v brew &>/dev/null || exit 1

        BREWFILE="$DOTTIE_ROOT/Brewfile"
        if [[ -f "$BREWFILE" ]]; then
            brew bundle check --file="$BREWFILE" &>/dev/null
            exit $?
        fi
        ;;
esac
