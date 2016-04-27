
if [ -e ~/.clutchski/datadog ]
then

    mkdir -p ~/code
    ln -s /home/vagrant/ /home/vagrant/code/datadog || true

    # python env
    source ~/python/bin/activate
    export DOGWEB_DEFAULT_CONFIG_PATH=~/etc/datadog/development.ini

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
    alias vm="cd code/datadog/vm2 && vagrant ssh"
fi

