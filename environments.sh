#
# machine specific config
#

mkdir -p ~/.clutchski

# use python3 if pythont2 isn't installed
which python &> /dev/null
if [ $? -ne 0 ]
then
    alias_if_exists "python3" "python"
fi

# add a few friendlier aliases
alias_if_exists "gnome-open" "open"
alias_if_exists "sqlite3" "sqlite"
