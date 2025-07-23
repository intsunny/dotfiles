#!/bin/sh

run() {
    ${@}

    if [ "$?" != 0 ] ; then
        echo "We had an issue with the command: ${@}"
        echo "ERR0R! Abort!"
        exit 1
    fi
}

run_with_echo() {
    ${@} 1>/dev/null

    if [ "$?" == 0 ] ; then
        echo "OK!"
    else
        echo "We had an issue with the command: ${@}"
        echo "ERR0R! Abort!"
        exit 1
    fi
}

if [ -d extract ] ; then
    echo "extract directory not empty!"
    echo "Plz manually clear and rerun script"
    exit 1
fi

if [ "$1" == "" ] ; then
    echo "Plz provide URL to grab fonts front. (This script is designed to work with the fronts provided by:"
    echo "https://www.nerdfonts.com/"
    
    exit 1
fi

if [ -d ~/.local/share/fonts ] ; then
    echo -n "~/.local/share/fonts exists. Care to make a backup? [Y/n]: "

    read BACKUP_ANS

    if [ "${BACKUP_ANS}" != 'n' ] ; then
        DATE=$(date +"%Y-%m-%d_%H-%M-%S")

        run_with_echo tar cvf ~/.local/share/fonts-${DATE}.tar -C ~/.local/share fonts
    fi
else
    echo -n "The direction ~/.local/share/fonts/ does not exist. Create? [y/N]: "

    read CREATE_ANS

    if [ "${CREATE_ANS}" == 'y' ] ; then
        echo -n "Making ~/.local/share/fonts ...."
        run_with_echo mkdir -p ~/.local/share/fonts
    fi
fi

run mkdir extract

echo "Downloading font ..."

run_with_echo curl -LO "$1" --output-dir extract

echo "Extracting font ..."

run_with_echo unzip extract/*.zip -d extract

echo "Copying font files ..."

run_with_echo cp extract/*.ttf ~/.local/share/fonts

echo "Regenerating font cache"

run_with_echo fc-cache -f

echo "You can look for your new font via: "
echo "fc-list"
