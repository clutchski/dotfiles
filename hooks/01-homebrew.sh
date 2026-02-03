#!/bin/bash
# Homebrew installation and package management

case "$1" in
    pre-link)
        # Install Homebrew if missing (macOS only)
        if [[ "$(uname)" == "Darwin" ]] && ! command -v brew &>/dev/null; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi

        # Install packages from Brewfile
        BREWFILE="$DOTTIE_ROOT/Brewfile"
        if [[ -f "$BREWFILE" ]] && command -v brew &>/dev/null; then
            if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
                echo "[dry-run] would run: brew bundle --file=$BREWFILE"
            else
                brew bundle check --file="$BREWFILE" &>/dev/null || brew bundle --file="$BREWFILE"
            fi
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
