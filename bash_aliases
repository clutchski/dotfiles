# vim: syn=sh 

# load scripts
source ~/.z.sh

#
# env variables
#

export PYTHONSTARTUP=~/.pythonrc
export EDITOR=vim
export SCREENDIR=~/.screen
export PATH=$PATH:~/bin

#
# aliases
#

alias ..="cd .."
alias ll="ls -lh"
alias la="ll -a"
alias du="du -h"
alias df="df -h"
alias findname="find . -name "
alias rmswp="find . -name \".*.sw*\" -exec rm {} \;"
alias ip="ifconfig -a | grep \"inet\""
psgrep() {
    ps aux | grep $* | grep -v grep
}
vimglob () {
    vim `find . -name $*`
}
gsd () {
    sudo ~/bin/gsd.sh $*
}



# ack
which ack-grep &> /dev/null
if [ $? -eq 0 ]
then
    alias ack="ack-grep"
fi

alias aack="ack --all"
alias cssack="ack --css"
alias fmack="ack --fm"
alias jack="ack --java"
alias jsack="ack --js"
alias pyack="ack --python"
alias rback="ack --ruby"

gitvimdiff () {
    git diff $* | vimdiff -
}
