#!/bin/bash

xrandr --output DisplayPort-1 --right-of DisplayPort-2
xrandr --output DisplayPort-1 --primary

local-status &

exec dbus-run-session dwm
