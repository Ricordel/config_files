#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi


#ck-launch-session openbox-session
ck-launch-session openbox-session;
#exec ck-launch-session startxfce4;
