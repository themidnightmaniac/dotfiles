#!/bin/bash

while true; do

	#Gets the current weather and writes it to a file.
	curl -s wttr.in/Brasilia?format=%h+%t'\n'%c >$HOME/.scripts/dwm_bar/.weathercurrent

	#Gets the current price (in dollars) of any cryptocurrencie and writes it to a file.
	#curl -s rate.sx/BTC | tr '  ' ' ' >$HOME/.scripts/dwm_bar/.ratecurrent &&
	
	#Writes the date to a file.
	date "+%A %b %d %Y" > $HOME/.scripts/dwm_bar/.datecurrent

	#Writes how much free space is left in the home partition.
	df -H /dev/sda4 > $HOME/.scripts/dwm_bar/.diskinfocurrent
    
    #Updates the bar
    sh $HOME/.scripts/dwm_bar/barrefresh.sh
	sleep 3600;

done
