#! /bin/bash
#  Author: jie
#  TIME: Sat Oct  8 07:21:58 AM CST 2022
#  USAGE: To exchange CapsLk and Ctrl
if [[ -e /usr/share/X11/xkb/keycodes/evdev ]]; then
    if [ !-e /home/jie/backups/evdev.bak ]; then
        sudo cp /usr/share/X11/xkb/keycodes/evdev /home/jie/backups/evdev.bak
        echo "Success to backup"
    fi
    sudo sed -in 's/<CAPS> = 66/<CAPS> = 37/p; s/<LCTL> = 37/<LCTL> = 66/p' /usr/share/X11/xkb/keycodes/evdev
    echo "Success to exchange"
fi

