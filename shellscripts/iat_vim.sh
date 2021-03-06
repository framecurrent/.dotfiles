#!/bin/zsh
# Name:     iat_vim
# Desc:     Permits the editing of It's All Text files in Terminal-Vim
# Author:   Jon-Michael Deldin <dev@jmdeldin.com>
# URI:      http://github.com/jmdeldin/iat_vim

/usr/bin/osascript <<EOF
tell application "Terminal"
    activate
    tell application "System Events" to tell process "Terminal" to keystroke "t" using command down
    do script with command "vim '$1'" in selected tab of the front window
end tell
EOF
