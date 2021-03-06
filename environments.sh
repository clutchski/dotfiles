#
# machine specific config
#

mkdir -p ~/.clutchski

# enable go
which gimme &> /dev/null
if [ $? -eq 0 ]
then
   eval "$(gimme 1.11 &> /dev/null)" 
fi

# environment for work vm
if [ -e ~/.clutchski/datadog ]
then

    mkdir -p ~/code

    # python env
    source ~/python/bin/activate
    source ~/.user-env || true

    # go env
    export GOPATH=~/go
    export GOBIN=$GOPATH/bin
    export DDGO=$GOPATH/src/github.com/DataDog/
    export DD=~/code/datadog/
    export DOGWEB=~/code/datadog/dogweb/
    export DDJS=~/code/datadog/dogweb/dogweb/javascript/
    export DDJSX=~/code/datadog/dogweb/dogweb/javascript/datadog/react
    export DATADOG_ROOT=$DDGO

    # path
    export PATH=$PATH:~/code/datadog/dogweb/node_modules/.bin/:~/python/bin:/usr/local/go/bin/:$GOBIN:~/usr/bin

    alias super="sudo supervisorctl"
    alias psql="psql -h /tmp -U dog dogdata"
    alias cqlsh="PATH=/usr/bin/ cqlsh"
fi


# environment for datadog host machine
if [ -e ~/.clutchski/work ]
then
    export GOPATH=~/go
    export GOBIN=$GOPATH/bin
    export DDGO=$GOPATH/src/github.com/DataDog/
    export PATH=$PATH:$GOBIN
    mkdir -p $DDGO
    export DATADOG_ROOT=$DDGO

    export current_vm=$DATADOG_ROOT
    alias vm="cd $current_vm && vagrant ssh"
    alias up="cd $current_vm && vagrant up"
fi
