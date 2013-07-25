# Readable disk size.
alias du="du -h"
alias df="df -h"

alias_if_exists () {
    which $1 &> /dev/null
    if [ $? -eq 0 ]
    then
        alias $2="$1"
    fi
}

# Ubuntu aliases.
alias_if_exists "ack-grep" "ack"
alias_if_exists "gnome-open" "open"

# ack shortcuts
alias acka="ack --all"
alias ackcss="ack --css"
alias ackjava="ack --java"
alias ackjs="ack --js"
alias ackpy="ack --python"
alias ackrb="ack --ruby"
alias ackcoffee="ack --coffee"
alias ackc="ack --cc"
alias ackpyx="ack --cython"

# Common directories
alias code="cd ~/code"
alias notes="cd ~/Dropbox/notes"

# Use hub if we can.
alias_if_exists "hub" "git"
