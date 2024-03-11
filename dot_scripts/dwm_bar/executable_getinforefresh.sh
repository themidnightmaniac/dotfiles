#!/bin/bash
#Kills the sleep instance of the getinfo script. Useful when info isnt showing up in the bar.
kill $(pstree -spa | grep -m 1 -A 1 getinfo.sh | grep sleep | sed 's/[^0-9]*//g' | sed 's/.\{4\}$//')

