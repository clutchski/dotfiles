
alias ll="ls -l"

#uncomment on ubuntu
#alias ack="ack-grep"
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
