#!/bin/sh

# DP-2				laptop screen
# DP-3.1.5/HDMI-0	left monitor
# DP-3.1.6			center monitor
# DP-3.2			right monitor

if [[ $1 == "home-all" ]]; then
	xrandr --output DP-2 --off
	xrandr --output HDMI-0 --mode 2560x1440 --panning 2560x1440+0+560
	xrandr --output DP-3.1.6 --mode 2560x1440 --primary --panning 2560x1440+2560+560
	xrandr --output DP-3.2 --mode 2560x1440 --rotate right --panning 2560x1440+5120+0
elif [[ $1 == "home-2" ]]; then
	xrandr --output DP-2 --off
	xrandr --output DP-3.1.5 --auto
	xrandr --output DP-3.1.6 --right-of DP-3.1.5 --mode 2560x1440 --rate 170 --primary
	xrandr --output DP-3.2 --off
else 
	xrandr --output DP-2 --auto --primary
	xrandr --output HDMI-0 --off
	xrandr --output DP-3.1.5 --off
	xrandr --output DP-3.1.6 --off
	xrandr --output DP-3.2 --off
fi
