# vim: set filetype=bash 

# env variables

export PYTHONSTARTUP=~/.rc.py
export EDITOR=vim

# aliases

alias ll="ls -l"

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

alias findname="find . -name "
