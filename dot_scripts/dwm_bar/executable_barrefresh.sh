#!/bin/bash
#Kills the sleep instance of the bar script. Useful for updating the bar early. I binded this script to my vloume up and down keybindings, so when the volume is changed the bar gets updated.
kill $(pstree -spa | grep -m 1 -A 1 bar.sh | grep sleep | sed 's/[^0-9]*//g' | sed 's/30/''/')

	
#sed 's/.\{2\}$//')
