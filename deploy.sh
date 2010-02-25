#!/bin/bash

for f in screenrc vimrc bash_aliases ackrc
do
    cp $f ~/.${f}
done
