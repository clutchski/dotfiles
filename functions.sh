# Remove vim swp files
rmswp () {
    rm -f ~/.vim/tmp/*.sw*
    find . -name "*.sw*" -exec rm {} \;
}

# Tar a directory
tgzdir () {
    tar -cvzf `basename $1`.tgz $1
}

# Grep processes.
psgrep() {
    ps aux | grep $* | grep -v grep
}

# Man or help.
moh () {
    cmd=$1
    man $cmd
    if [ $? -ne 0 ]
    then
        $cmd --help
    fi
}

# Delete file contents.
devnull () {
    cat /dev/null > $1
}

# Create an executable file.
exe () {
    touch $1 && chmod a+x $1
}

# Tag the current directory.
tag () {
    ctags -R -o tags .

}

# Print the directory of a Python module.
pydir ()  {
    python -c "import $1,os; print os.path.dirname($1.__file__)"
}

# Change to the directory of a Python module.
pycd ()  {
    cd `pydir $1`
}
