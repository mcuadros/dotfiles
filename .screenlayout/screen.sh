#!/usr/bin/env bash
DIR="${0%/*}"

IN="eDP-1-1"
EXT1="DP-1-2"
EXT2="DP-1-1"

xrandr | grep "$EXT1 disconnected" > /dev/null
EXT1_CONNECTED=$?

xrandr | grep "$EXT2 disconnected" > /dev/null
EXT2_CONNECTED=$?



if [ $EXT1_CONNECTED -eq 0 ]; then
  echo "-> Laptop mode"
  $DIR/laptop.sh
elif [ $EXT2_CONNECTED -eq 0 ]; then
  echo "-> Desktop mode"
  $DIR/desktop.sh
else
  echo "-> Desktop extended mode"
  $DIR/desktop-extended.sh
fi
