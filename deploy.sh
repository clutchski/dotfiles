#!/bin/bash

for f in screenrc vimrc bash_aliases ackrc gitconfig
do
    cp $f ~/.${f}
done
