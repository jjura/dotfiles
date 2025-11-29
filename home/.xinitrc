#!/bin/bash

amixer set "Com Speaker" 100%
amixer set "Mic" 100%

local-status &

xrandr                       \
    --output DisplayPort-1   \
    --mode 1920x1080         \
    --rate 180.00            \
    --right-of DisplayPort-2 \
    --primary

xrandr                     \
    --output DisplayPort-2 \
    --mode 1920x1080       \
    --rate 180.00

exec dbus-run-session dwm
