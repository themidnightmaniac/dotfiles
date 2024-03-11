#!/bin/bash

info() {
  echo "-----------------------------------------------------------------------------------------"
  echo
  echo "Your Info:"
  echo
  sudo zerotier-cli info
  echo
  echo "Your Connections:"
  echo
  sudo zerotier-cli listnetworks
  echo
  echo "-----------------------------------------------------------------------------------------"
  echo
  echo "Make sure everyone is added and autorized in the network page on the My Zerotier Website"
  echo 
  echo "-----------------------------------------------------------------------------------------"
}

start_msg() {
  echo "-----------------------------------------------------------------------------------------"
  echo
  echo "Starting ZeroTier-One"
  echo
}

stop_msg() {
  echo "-----------------------------------------------------------------------------------------"
  echo
  echo "Stopping ZeroTier-One"
  echo
  echo "-----------------------------------------------------------------------------------------"
}

options="Start\nStop\nInfo\nExit"

selected=$(echo -e "$options" | rofi -config /home/ncho/.scripts/zerotier/alt.rasi -i -dmenu -p "Zerotier-One Options")

case "$selected" in
  Start)  sudo systemctl start zerotier-one.service && start_msg && info;;
  Stop)   sudo systemctl stop zerotier-one.service && stop_msg;;
  Info)   info;;
  Exit)   exit;;
esac

