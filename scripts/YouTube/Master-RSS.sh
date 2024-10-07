#!/bin/bash
# Master-feed-YT
#
#Add to cron: @reboot /home/username/.config/conky/scripts/YouTube/Master-RSS.sh


# Run all the feed scripts
DIR="$HOME/.config/conky/scripts/YouTube"

while true; do
    for script in $DIR/*-feed.sh; do
        $script
    done
    sleep 300  # Sleep for 300 seconds (5 minutes)
done

