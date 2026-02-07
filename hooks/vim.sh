#!/bin/bash
# Vim-plug installation

if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
    echo "[dry-run] $(basename "$0")"
    exit 0
fi

case "$1" in
    post-link)
        if [ ! -f ~/.vim/autoload/plug.vim ]; then
            curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            vim +PlugInstall +qall < /dev/null > /dev/null 2>&1
        fi
        ;;
    status)
        [ -f ~/.vim/autoload/plug.vim ]
        ;;
esac
