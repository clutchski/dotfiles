#!/bin/bash
# Generate zsh completions for installed tools

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

COMP_DIR="$HOME/.zsh/completions"

# target_file:command to generate it
COMPLETIONS=(
    "_mise:mise completion zsh"
    "_rustup:rustup completions zsh rustup"
    "_cargo:rustup completions zsh cargo"
)

case "$1" in
    pre-link)
        mkdir -p "$COMP_DIR"

        for entry in "${COMPLETIONS[@]}"; do
            target="${entry%%:*}"
            cmd="${entry#*:}"
            tool="${cmd%% *}"

            if [[ ! -f "$COMP_DIR/$target" ]] && command -v "$tool" &>/dev/null; then
                echo "Generating $target..."
                $cmd > "$COMP_DIR/$target"
            fi
        done
        ;;
    status)
        for entry in "${COMPLETIONS[@]}"; do
            target="${entry%%:*}"
            cmd="${entry#*:}"
            tool="${cmd%% *}"

            if command -v "$tool" &>/dev/null && [[ ! -f "$COMP_DIR/$target" ]]; then
                exit 1
            fi
        done
        ;;
esac
