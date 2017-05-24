#!/usr/bin/env bash

IN="eDP1"
EXT="DP1"

xrandr > /dev/null
xrandr | grep "$EXT disconnected" > /dev/null

if [ $? -eq 0 ]; then
  xrandr --output $IN --dpi 216 --primary --auto --output $EXT --off
  #xmodmap -e "pointer = 1 2 3" 2> /dev/null
  echo "-> Laptop mode"
else
  xrandr --output $IN --off --output $EXT --primary --dpi 184 --auto
  #xmodmap -e "pointer = 3 2 1" 2> /dev/null
  echo "-> Desktop mode"
fi
