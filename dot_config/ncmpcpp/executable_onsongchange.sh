#!/usr/bin/zsh
sh $HOME/.config/ncmpcpp/cover_obs.sh &&
sh $HOME/.scripts/dwm_bar/barrefresh.sh 2> /dev/null &&
if [[ $(pstree | grep dunst) ]]; then
  killall dunst 2> /dev/null
  notify-send -u low "Now playing:" "$(mpc current)"
else
  notify-send -u low "Now playing:" "$(mpc current)"
fi
