#!/bin/bash

set -e

# deploy
for f in `ls . `
do
    if [[ $f == "README" ]] || [[ $f == "deploy.sh" ]] ; then
        continue
    fi

    if [ -d $f ]; then
        mkdir -p ~/.${f}
        cp -r ${f}/* ~/.${f}
    else
        cp $f ~/.${f}
    fi

done

# git doesn't seem to like relative paths in here.
sed -i -e "s|#HOME#|$HOME|" ~/.gitconfig
