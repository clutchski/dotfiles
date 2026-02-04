#!/bin/bash
# Vim-plug installation

case "$1" in
    post-link)
        if [ ! -f ~/.vim/autoload/plug.vim ]; then
            if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
                echo "[dry-run] would install vim-plug"
            else
                curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
                    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                vim +PlugInstall +qall < /dev/null > /dev/null 2>&1
            fi
        fi
        ;;
    status)
        [ -f ~/.vim/autoload/plug.vim ]
        ;;
esac
