#!/bin/bash

# Note:
# This script depends on "audiodevice" command.
# You need to install it in advance.
# http://whoshacks.blogspot.jp/2009/01/change-audio-devices-via-shell-script.html

function usage() {
    cat <<EOF
Usage: $(basename $0) [options] [commands]

Commands:
status          Show sound status
volume [value]  Set sound volume (ex. 100)
mute [bool]     Set mute sound (true/false)
input [device]  Set input device
output [device] Set output device

Options:
-h, --help      Show help message
EOF
}

# Get volume level
function getVolume() {
    osascript -e 'output volume of (get volume settings)'
}

# Set volume level
function setVolume() {
    osascript -e "set volume output volume $1"
}

# Set system mute status
function mute() {
    osascript -e "set volume output muted $1"
}

[ $# == 0 ] && usage

for OPT in "$@"; do
    case "$OPT" in
        'input'|'in')
            audiodevice input $1
            break
            ;;
        'output'|'out')
            audiodevice output $1
            break
            ;;
        'mute')
            mute $2
            break
            ;;
        'volume'|'vol')
            setVolume $2
            break
            ;;
        'status'|'state'|'get')
            echo "# Current settings"
            echo "volume: $(getVolume)"
            audiodevice
            echo; echo "# Input devices"
            audiodevice input list
            echo; echo "# Output devices"
            audiodevice output list
            break
            ;;
        '--help'|'-h')
            usage
            break
            ;;
        *)
            echo 'Invalid argument'
            usage
            exit 1
            ;;
    esac
done
