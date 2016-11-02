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

