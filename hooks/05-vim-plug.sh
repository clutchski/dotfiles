#!/bin/bash
# Vim-plug installation

case "$1" in
    post-link)
        if [ ! -f ~/.vim/autoload/plug.vim ]; then
            if [[ "$DOTTIE_DRY_RUN" == "true" ]]; then
                echo "[dry-run] would install vim-plug"
            else
                curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                vim +PlugInstall +qall
            fi
        fi
        ;;
    status)
        [ -f ~/.vim/autoload/plug.vim ]
        ;;
esac
