# Remove vim swp files
rmswp () {
    rm -f ~/.vim/tmp/*.sw*
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

