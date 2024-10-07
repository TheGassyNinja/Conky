#!/bin/bash
# DistroTube	        https://www.youtube.com/@DistroTube         # UCVls1GmFKf6WlTraIb_IaJg
NAME="DT"
FEED="https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg"

output="$HOME/.local/tmp/RSS/$NAME.feed"
touch $output
	title=$(curl -s $FEED | grep "media:title" | grep -oP '(?<=\>).*?(?=\<)' | head -n 1)
	URL=$(curl -s $FEED | grep "media:content" | grep -oP '(?<=url=").*?(?=")' | head -n 1 | cut -d'?' -f1)
    echo "$NAME: $title" > $output
    echo -e "    URL: $URL\n" >> $output
    echo "$NAME: $title"
    echo "    URL: $URL" 
