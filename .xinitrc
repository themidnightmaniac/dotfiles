#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset s 180;
xset -dpms

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
mpd --kill; mpd "$HOME/.config/mpd/mpd.conf" &
picom -b &
dwmblocks &
xwallpaper $(cat $HOME/.local/share/wallpaper) &
xbindkeys -f $HOME/.config/xbindkeysrc &
redshift &
mpdaemon &
xss-lock lock-screen&
updateblocks &
exec dbus-run-session dwm
