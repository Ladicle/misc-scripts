#!/bin/bash

afplay /System/Library/Sounds/Ping.aiff -v 2
# osascript -e 'beep 3'
# tput bel
osascript -e 'display notification "Complete!" with title "iTerm2"'
