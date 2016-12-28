#!/bin/sh

urxvtd -q -o -f
setxkbmap -layout us,ru -option grp:alt_shift_toggle
numlockx
# amixer -c 0 set "Master Mono" 69% unmute
feh --bg-fill Pictures/clouds.jpg
xrdb -merge .Xresources
xset m 0 0

# requires conky-cli and xkblayout-state from AUR
format="%s | \x07%08s \x06%08s \x01 \x02%03s%% %03s%% %03s%% %03s%%\x01 \x05%08s %02s%%\x01 | %s\n"
conky -c .conkyrc | while read -r
do
	layout=$(xkblayout-state print "%s")
	date=$(date +"%T %a %d %b")
	str=$(printf "$format" "$layout" $REPLY "$date")
	xsetroot -name "$str"
done &

exec startlxde

