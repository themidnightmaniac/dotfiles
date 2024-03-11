  #!/bin/bash

brightness=1

gamma=1:1:1

while true; do
  
  options="Profile1\nProfile2\nProfile3\nYellowLightOn\nYellowLightOff\nBrightnessUp\nBrightnessDown\nReset\nExit"

  selected=$(echo -e "$options" | rofi -i -config alt.rasi -dmenu )

  output=$(xrandr --query | sed -n 's/^\([^ ]*\) connected.*/\1/p')

  case "$selected" in
    BrightnessUp)   brightness=$(echo $brightness+.3 | bc);xrandr --output $output --gamma $gamma --brightness $brightness;;
    BrightnessDown) brightness=$(echo $brightness-.3 | bc);xrandr --output $output --gamma $gamma --brightness $brightness;;
    YellowLightOn)  xrandr --output $output --brightness $brightness --gamma 1.0:0.87:0.73; gamma=1.0:0.87:0.73;;
    YellowLightOff) xrandr --output $output --brightness $brightness --gamma 1.0:1.0:1.0;   gamma=1:1:1;;
    Profile1)       xrandr --output $output --brightness 0.8 --gamma 1.0:1.0:1.0;           break;;
    Profile2)       xrandr --output $output --brightness 0.7 --gamma 1.0:0.9:0.8;           break;;
    Profile3)       xrandr --output $output --brightness 0.6 --gamma 1.0:0.87:0.73;         break;;
    Reset)          xrandr --output $output --brightness 1.0 --gamma 1.0:1.0:1.0;;
    Exit)           break;;
  esac
done

