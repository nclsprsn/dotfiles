#!/bin/bash
#
# Start a composition manager.
# (compton in this case)

function comphelp () {
    echo "Composition Manager:"
    echo "   (re)start: COMP"
    echo "   stop:      COMP -s"
    echo "   query:     COMP -q"
    echo "              returns 1 if composition manager is running, else 0"
    exit
}

function checkcomp () {
    ( ps nc -C compton &>/dev/null ) && exit 1
    exit 0
}

function stopcomp () {
    ( ps nc -C compton &>/dev/null ) && killall compton
}

function startcomp () {
    stopcomp
    compton -CGf -m 0.9 -D 3 --backend glx --vsync opengl-swc > /dev/null 2>&1
    exit
}

case "$1x" in
    "x") startcomp;;
    "-qx") checkcomp;;
    "-sx") stopcomp; exit;;
    *) comphelp;;
esac
