#!/bin/sh

try_exec() {
    ${@}

    if [ "$?" == 0 ] ; then
        echo "OK!"
    else
        echo "ERR0R! Abort!"
        exit 1
    fi
}

if [ -d ~/.local/share/fonts ] ; then
    echo -n "~/.local/share/fonts exists. Care to make a backup? [Y/n]: "

    read BACKUP_ANS

    if [ "${BACKUP_ANS}" != 'n' ] ; then
        DATE=$(date +"%Y-%m-%d_%H-%M-%S")

        try_exec tar cvf ~/.local/share/fonts-${DATE}.tar -C ~/.local/share fonts
    fi
else
    echo -n "The direction ~/.local/share/fonts/ does not exist. Create? [y/N]: "

    read CREATE_ANS

    if [ "${CREATE_ANS}" == 'y' ] ; then
        echo -n "Making ~/.local/share/fonts ...."
        try_exec mkdir -p ~/.local/share/fonts
    fi
fi
