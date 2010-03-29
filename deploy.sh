#!/bin/bash

set -e

# template git profile

echo
echo "enter your global git profile: your@email.com Your Name"
read email name

sed -e "s|#NAME#|$name|" -e "s|#EMAIL#|$email|" gitconfig.template > gitconfig

# deploy the files

for f in screenrc vimrc bash_aliases ackrc gitconfig gitignore
do
    cp $f ~/.${f}
done

# clean-up

rm gitconfig
