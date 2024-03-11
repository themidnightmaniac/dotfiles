#!/bin/bash

options="Reboot\nSuspend\nShutdown\nLogout\nLock"

selected=$(echo -e "$options" | rofi -config /home/ncho/.scripts/powermenu/alt.rasi -i -dmenu -p "Power Menu")

case "$selected" in
  Shutdown) shutdown -P now;;
  Reboot) shutdown -r now;;
  Suspend) systemctl suspend;;
  Logout) kill $XSESSION_PID;;
  Lock) export XSECURELOCK_PASSWORD_PROMPT=time_hex && xsecurelock;;
esac	
