#!/bin/bash
# GitHub CLI installation (Linux only)

# Only run on Linux with apt-get
[[ "$(uname)" == "Linux" ]] && command -v apt-get &>/dev/null || exit 0

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    pre-link)
        if ! command -v gh &>/dev/null; then
            curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
            sudo apt-get update
            sudo apt-get install -y gh
        fi
        ;;
    status)
        command -v gh &>/dev/null || exit 1
        ;;
esac
