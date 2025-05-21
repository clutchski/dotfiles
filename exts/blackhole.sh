#!/usr/bin/env bash

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


