#!/bin/bash

set -e

# template git profile
echo "enter your global git user name:"
read name
echo "enter your global git e-mail:"
read email

sed -e "s|#HOME#|$HOME|" -e "s|#NAME#|$name|" -e "s|#EMAIL#|$email|" gitconfig.template > gitconfig

# deploy
for f in screenrc vimrc bash_aliases ackrc gitconfig gitignore pythonrc z.sh gntrc gemrc tmux.conf zshrc
do
    cp $f ~/.${f}
done

for d in vim bin oh-my-zsh
do
    mkdir -p ~/.${d}
    cp -r ${d}/* ~/.${d}
done

# clean-up
rm gitconfig
