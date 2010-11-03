#!/bin/bash

set -e

# template git profile
echo "enter your global git user name:"
read name
echo "enter your global git e-mail:"
read email

sed -e "s|#HOME|$HOME|" -e "s|#NAME#|$name|" -e "s|#EMAIL#|$email|" gitconfig.template > gitconfig

# deploy
for f in screenrc vimrc bash_aliases ackrc gitconfig gitignore pythonrc
do
    cp $f ~/.${f}
done

mkdir -p ~/.vim
cp -r vim/* ~/.vim

mkdir -p ~/bin

which git &> /dev/null
if [ $? -eq 0 ]
then
    git config --global core.excludesfile ~/.gitignore
fi


# clean-up
rm gitconfig
