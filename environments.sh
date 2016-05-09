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
    source ~/.profile

    eval "$(gimme 1.4.2)"

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
fi


# environment for datadog host machine
if [ -e ~/.clutchski/work ]
then
    alias vm="cd ~/code/datadog/vms/2016-04-27 && vagrant ssh"
    alias up="cd ~/code/datadog/vms/2016-04-27 && vagrant up"
fi
