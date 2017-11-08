#!/bin/bash

cd $(dirname $0)

BIN_DIR=$GOPATH/bin

for f in $(ls); do
    echo $f | grep '\.' > /dev/null && continue
    ln -Fis $PWD/$f $BIN_DIR
done
