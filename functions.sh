
# Push the current branch to orign.
alias gitpush='git push -u origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gitst="git st"


# Force push the current branch, as long as it's not master or main.
gitforcepush() {
  branch=$(git rev-parse --abbrev-ref HEAD)

  if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
    echo "No force pushing to '$branch"
  else
    git push origin --force "$branch"
  fi
}

# Remove vim swp files
vimclean () {
    rm -rf ~/.vim/tmp
    mkdir -p ~/.vim/tmp
    rm -rf ~/.cache/ctrlp
    find . -name "*.sw*" -exec rm {} \;
}

# Print the directory of a Python module.
pymod ()  {
    # FIXME: could replace in the middle of a path
    python -c "import $1; print($1.__file__.replace('.pyc', '.py'))"
}

alias_if_exists () {
    which $1 &> /dev/null
    if [ $? -eq 0 ]
    then
        alias $2="$1"
    fi
}

camera_reset() {
    sudo killall VDCAssistant
    sudo killall AppleCameraAssistant
}

youtube_to_mp3() {
    yt-dlp --extract-audio --audio-format mp3 $1:x
}

etchost_block () {
  if [[ $# -eq 0 ]]; then
    # no args == show list of already-blocked hosts
    grep --color=never --ignore-case --extended-regexp "^##\s+block" /etc/hosts | cut -d" " -f 3-
  else
    # loop through hosts and block each one on ipv4 + ipv6
    while (($#)); do
      if ! grep -q "## block $1" /etc/hosts; then
        echo "echo \"\n## block $1\"        >> /etc/hosts" | sudo sh
        echo "echo \"127.0.0.1  $1 www.$1\" >> /etc/hosts" | sudo sh
        echo "echo \"::1        $1 www.$1\" >> /etc/hosts" | sudo sh
        echo "echo \"## /block $1\"         >> /etc/hosts" | sudo sh
      fi
      shift
    done
  fi
}

etchost_unblock () {
  while (($#)); do
    # remove specified hosts and squash multiple empty lines
    newContents=$(sed "/## block $1/,/## \/block/d" /etc/hosts | sed '/./,/^$/!d')
    echo "echo \"$newContents\" > /etc/hosts" | sudo sh
    shift
  done
}


etchost_block_blackholes() {
    while read b; do
        etchost_block $b
    done < ~/.blackholes
}
