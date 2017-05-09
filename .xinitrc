#!/bin/sh

export LANG="ru_RU.UTF-8"
export PATH="${PATH}:/home/mello/.config/lemonbar"

xrdb -I$HOME/.colors -merge ~/.Xresources

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle, grp_led:scroll"

xset -dpms && xset s off
nitrogen --restore
xsetroot -cursor_name left_ptr
numlock.sh
dunst &
sxhkd &
exec bspwm > .xinit.log 2>&1
