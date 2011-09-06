#!/bin/bash

set -e

#
# deploy
#

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

#
# update git config
#

git config --global core.excludesfile ~/.gitignore

if [[ -n $1  &&  -n $2 ]] ; then
    git config --global user.name "$1"
    git config --global user.email "$2"
fi
