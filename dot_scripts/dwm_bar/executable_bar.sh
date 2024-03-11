#!/usr/bin/sh

#Defines the separator character.
sep="|"

status() {

	echo " "

	#Displays the current price of Bitcoin. The coin and the file can be set in the curl command above.
	#cat $HOME/.scripts/dwm_bar/.ratecurrent |
	#      	awk '/avg:/ {print $1,$2}' |
	#      		sed 's/avg:/󰠓/;s/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' &&
	#echo "$sep" &&

	#Displays the current playing song, it requires mpc and obviously mpd.
	if [[ $(mpc current) ]]; then
		mpc | head -2 | tail -1 | grep -o [a-z] | tr -d '\n' | sed 's/.*/\u&/' &&
		echo ":"
		mpc current &&
		echo "$sep"
	fi

	#Displays an icon for the current weather condition, temperature (in celsius) and humidity.
	sed "s/.*☀.*/󰖙/;s/.*☁.*/󰖐,/;s/.*⛅.*/󰖕/;s/.*⛈.*/󰙾/;s/.*✨.*//;s/.*❄.*/󰜗/;s/.*🌦.*/󰼳/;s/.*🌧.*/󰖗/;s/.*🌨.*/󰖘/;s/.*🌩.*/󰖓/;s/.*🌫.*/󰖑/" "$HOME"/.scripts/dwm_bar/.weathercurrent | tr '\n' ' '
	#Uncomment if you want an icon to warn you if the humidity is lower than 40%
	# | awk '{if ($1 >= 40) print $1" 󰖌", $2, $3; else print $1" 󱔂", $2, $3 }' &&

	echo " $sep" &&

    #Displays the system date.
    cat "$HOME"/.scripts/dwm_bar/.datecurrent &&
    echo "$sep"

	#Displays the system's hour and minutes.
	date "+%I:%M %p" &&
	echo "$sep" &&

    #Displays Master's state and volume percentage.
    #amixer get 'Master' |
    #      	grep -o -m 1 "[0-9]*%" |
    amixer get 'Master' | grep -oP -m 3 '[0-9]\s\K.*' | sed '1,2d; s/\[//g; s/\]//g; s/on/On/; s/off/Mute/' | awk '{if ($1+0 <= 50) print $1,"󰖀",$2; else print $1,"󰕾",$2;}' &&
    echo "$sep" &&

    #Displays the free space of the $HOME partition.
    grep dev "$HOME"/.scripts/dwm_bar/.diskinfocurrent | awk '{print "󱂶 "$4}' &&
    echo "$sep" &&

    #Check the ethernet adapter's state and displays and icon for it.
    sed "s/down//;s/up//" /sys/class/net/e*/operstate &&
    echo "$sep" &&

    #Check the wifi adapter's state and displays and icon for it.
    sed "s/down/󰖪/;s/up/󰖩/" /sys/class/net/w*/operstate

}

while true; do

	xsetroot -name "$(status | tr '\n' ' ')" &&
		sleep 30

done
