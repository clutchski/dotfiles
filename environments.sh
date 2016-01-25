
if [ -e ~/.clutchski/datadog ]
then

    source ~/dogweb/python/bin/activate
    export DOGWEB_DEFAULT_CONFIG_PATH=~/code/datadog/dogweb/development.ini

    # go env
    export GOPATH=~/code/datadog/go
    export GOBIN=$GOPATH/bin
    export DDGO=$GOPATH/src/github.com/DataDog/
    export DD=~/code/datadog/
    export DOGWEB=~/code/datadog/dogweb/
    export DDJS=~/code/datadog/dogweb/dogweb/javascript/
    export DDJSX=~/code/datadog/dogweb/dogweb/javascript/datadog/react

    # path
    export PATH=$PATH:~/code/datadog/dogweb/node_modules/.bin/:~/python/bin:/usr/local/go/bin/:$GOBIN

    alias super="sudo supervisorctl"
fi
