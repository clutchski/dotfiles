#
# machine specific config
#

mkdir -p ~/.clutchski

# environment for work vm
if [ -e ~/.clutchski/datadog ]
then

    mkdir -p ~/code

    # python env
    source ~/python/bin/activate
    source ~/.profile || true
    source ~/.user-env || true

    eval "$(gimme 1.7.1)"

    # go env
    export GOPATH=~/code/datadog/go
    export GOBIN=$GOPATH/bin
    export DDGO=$GOPATH/src/github.com/DataDog/
    export DD=~/code/datadog/
    export DOGWEB=~/code/datadog/dogweb/
    export DDJS=~/code/datadog/dogweb/dogweb/javascript/
    export DDJSX=~/code/datadog/dogweb/dogweb/javascript/datadog/react

    # path
    export PATH=$PATH:~/code/datadog/dogweb/node_modules/.bin/:~/python/bin:/usr/local/go/bin/:$GOBIN:~/usr/bin

    alias super="sudo supervisorctl"
    alias psql="psql -h /tmp -U dog dogdata"
    alias cqlsh="PATH=/usr/bin/ cqlsh"
fi


# environment for datadog host machine
if [ -e ~/.clutchski/work ]
then
    export GOPATH=~/code/datadog/go
    export GOBIN=$GOPATH/bin
    export DDGO=$GOPATH/src/github.com/DataDog/
    mkdir -p $DDGO

    eval "$(gimme 1.7.1)"

    export current_vm="~/code/datadog/vms/current"
    alias vm="cd $current_vm && vagrant ssh"
    alias up="cd $current_vm && vagrant up"
fi
