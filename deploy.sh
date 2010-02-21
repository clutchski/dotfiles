#!/bin/bash


for f in screenrc vimrc bash_aliases
do
    cp $f ~/.${f}
done

