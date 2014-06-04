
if [ -e ~/.clutchski/datadog ]
then

    source ~/python/bin/activate
    export DOGWEB_DEFAULT_CONFIG_PATH=~/code/datadog/dogweb/development.ini

    # go env
    export GOPATH=~/code/datadog/go
    export GOBIN=$GOPATH/bin
    export DDGO=$GOPATH/src/github.com/DataDog/

    # path
    export PATH=$PATH:~/code/datadog/dogweb/node_modules/.bin/:~/python/bin:/usr/local/go/bin/:$GOBIN

    alias super="sudo supervisorctl"
fi
