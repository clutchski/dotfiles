# Readable disk size.
alias du="du -h"
alias df="df -h"

# ack = ack-grep on ubuntu
which ack-grep &> /dev/null
if [ $? -eq 0 ]
then
    alias ack="ack-grep"
fi

# ack shortcuts
alias acka="ack --all"
alias ackcss="ack --css"
alias ackjava="ack --java"
alias ackjs="ack --js"
alias ackpy="ack --python"
alias ackrb="ack --ruby"
