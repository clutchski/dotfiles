# Remove vim swp files
vimclean () {
    rm -rf ~/.vim/tmp
    mkdir -p ~/.vim/tmp
    rm -rf ~/.cache/ctrlp
    find . -name "*.sw*" -exec rm {} \;
}

# tags
tag () {
    ctags -R -o tags .
}

# Print the directory of a Python module.
pymod ()  {
    # FIXME: could replace in the middle of a path
    python -c "import $1; print $1.__file__.replace('.pyc', '.py')"
}

gogo() {
    cd $GOPATH/src
}

alias_if_exists () {
    which $1 &> /dev/null
    if [ $? -eq 0 ]
    then
        alias $2="$1"
    fi
}

usrbin() {
    curl --data "@$1" https://usrbin.herokuapp.com/
}

alias_if_exists "gnome-open" "open"
alias_if_exists "sqlite3" "sqlite"

camera_reset() {
    sudo killall VDCAssistant
    sudo killall AppleCameraAssistant
}
