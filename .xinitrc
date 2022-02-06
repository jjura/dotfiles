if [ -f $HOME/.Xresources ]; then
    xrdb $HOME/.Xresources
fi

if [ -f $HOME/.config/compton/compton.conf ]; then
    compton -b --config $HOME/.config/compton/compton.conf
fi

if [ -f $HOME/Images/wallpaper ]; then
    feh --no-fehbg --bg-scale $HOME/Images/wallpaper
fi

if xrandr | grep "DP-3-1 connected"; then
    xrandr --output DP-3-1 --set "Broadcast RGB" "Full"
    xrandr --output DP-3-2 --set "Broadcast RGB" "Full"
fi

statusbar &
exec dwm
