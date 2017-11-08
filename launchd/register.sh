#!/bin/bash

cd $(dirname $0)

LAUNCHD_DIR=$HOME/Library/LaunchAgents/

for f in $(ls *.plist); do
    ln -Fis $PWD/$f $LAUNCHD_DIR
done

cd $LAUNCHD_DIR
launchctl load *.plist
