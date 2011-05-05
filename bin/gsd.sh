#!/usr/bin/env bash

SITES="reddit.com news.ycombinator.com twitter.com facebook.com youtube.com vimeo.com delicious.com flickr.com nytimes.com thestar.com theonion.com tumblr.com amazon.com"

HOSTFILE="/etc/hosts"

if [ ! -w $HOSTFILE ]
then
    echo "cannot write to $HOSTFILE, try running with sudo"
    exit 1
fi

# clean up previous entries from /etc/hosts
sed -i -e '/#gsd$/d' $HOSTFILE

# write hosts file if 'work' mode
if [ "$1" != "--play" ]
then
    for SITE in $SITES
    do
	echo -e "127.0.0.1\t$SITE\t#gsd" >> $HOSTFILE
    done
    echo "work mode enabled, run with --play to disable"
fi

/etc/init.d/networking restart
