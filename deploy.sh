#!/bin/bash

for f in screenrc vimrc bash_aliases ackrc gitconfig gitignore
do
    cp $f ~/.${f}
done
