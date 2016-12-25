#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

export GDK_SCALE=2
export GDK_DPI_SCALE=1

/home/mcuadros/.config/i3/screen.sh
exec i3
