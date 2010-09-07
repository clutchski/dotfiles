#!/bin/bash

set -e

# template git profile
echo "enter your global git user name:"
read name
echo "enter your global git e-mail:"
read email

sed -e "s|#NAME#|$name|" -e "s|#EMAIL#|$email|" gitconfig.template > gitconfig

# deploy
for f in screenrc vimrc bash_aliases ackrc gitconfig gitignore pythonrc
do
    cp $f ~/.${f}
done

mkdir -p ~/.vim
cp -r vim/* ~/.vim

mkdir -p ~/bin

# clean-up
rm gitconfig
