# Remove vim swp files
vimclean () {
    rm -rf ~/.vim/tmp
    find . -name "*.sw*" -exec rm {} \;
    rm -rf ~/.cache/ctrlp
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

# Ubuntu aliases.
alias_if_exists "gnome-open" "open"
