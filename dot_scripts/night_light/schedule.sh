#!/bin/bash

# Define your screen name
screen_name="$(xrandr --query | sed -n 's/^\([^ ]*\) connected.*/\1/p')"

# Define brightness levels
normal_brightness="1.0"
dimmed_brightness="0.7"
more_dimmed_brightness="0.6"
max_dimmed_brightness="0.5"
early_dimmed_brightness="0.8"

# Define the filter levels
no_filter="1:1:1"
min_filter="1:0.95:0.81"
medium_filter="1:0.92:0.79"
max_filter="1:0.87:0.73"

while true; do
    current_hour=$(date +"%H")

    if ((current_hour >= 17 && current_hour < 18)); then
        # Between 5 PM and 6 PM: Early dimmed brightness
        xrandr --output "$screen_name" --brightness "$early_dimmed_brightness" --gamma $no_filter
        next_event_hour=18

    elif ((current_hour >= 18 && current_hour < 20)); then
        # Between 6 PM and 8 PM: Dimmed brightness
        xrandr --output "$screen_name" --brightness "$dimmed_brightness" --gamma $min_filter
        next_event_hour=20

    elif ((current_hour >= 20 && current_hour < 24)); then
        # Between 8 PM and 12 AM: More dimmed brightness
        xrandr --output "$screen_name" --brightness "$more_dimmed_brightness" --gamma $medium_filter
        next_event_hour=23

    elif ((current_hour >= 0 && current_hour < 6)); then
        # Between 11 AM and 6 AM: Max dimmed brightness
        xrandr --output "$screen_name" --brightness "$max_dimmed_brightness" --gamma $max_filter
        next_event_hour=6

    elif ((current_hour >= 6 && current_hour < 17)); then
        # Between 6 AM and 5 PM: Restore normal brightness
        xrandr --output "$screen_name" --brightness "$normal_brightness" --gamma $no_filter
        next_event_hour=17

    else
        # Handle unexpected cases by restoring normal brightness
        xrandr --output "$screen_name" --brightness "$normal_brightness" --gamma $no_filter
        next_event_hour=$(( (current_hour + 1) / 4 * 4 ))  # Reset for the next 4-hour interval
    fi

    # Calculate sleep duration until the next event
    sleep_until=$(date -d "tomorrow $next_event_hour:00" +%s)
    current_time=$(date +%s)
    sleep_duration=$((sleep_until - current_time))

    # Sleep until the next event
    if [ "$sleep_duration" -gt 0 ]; then
        sleep $sleep_duration
    fi
done


