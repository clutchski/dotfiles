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
pymod ()  {
    # FIXME: could replace in the middle of a path
    python -c "import $1; print $1.__file__.replace('.pyc', '.py')"
}

pyprofile() {
    prof=$1
    shift 1
    python -m cProfile -o $prof $*
    echo "wrote profile to $prof"
}

pystats() {
    python -m pstats $*
}


# Search for a file by name.
name () {
    find . -name $*
}

sumlines () {
    awk '{s+=$1} END {print s}'
}

epoch() {
    date +%s
}
