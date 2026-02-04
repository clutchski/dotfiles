#!/bin/bash
# APT package management (Linux with apt-get only)

PACKAGES=(
    curl
    wget
    htop
    git
    zsh
)

# Only run on Linux with apt-get
[[ "$(uname)" == "Linux" ]] && command -v apt-get &>/dev/null || exit 0

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    pre-link)
        sudo apt-get update
        sudo apt-get install -y "${PACKAGES[@]}"
        ;;
    status)
        for pkg in "${PACKAGES[@]}"; do
            dpkg -s "$pkg" &>/dev/null || exit 1
        done
        ;;
esac
