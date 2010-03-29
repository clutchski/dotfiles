#!/bin/bash

set -e

# template git profile
echo "enter your global git user name:"
read name
echo "enter your global git e-mail:"
read email

sed -e "s|#NAME#|$name|" -e "s|#EMAIL#|$email|" gitconfig.template > gitconfig

# deploy the files
for f in screenrc vimrc bash_aliases ackrc gitconfig gitignore
do
    cp $f ~/.${f}
done

# clean-up
rm gitconfig
