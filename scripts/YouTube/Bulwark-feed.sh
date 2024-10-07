#!/bin/bash
# TheBulwark	        https://www.youtube.com/@Bulwarkmedia       # UCG4Hp1KbGw4e02N7FpPXDgQ
NAME="Bulwark"
FEED="https://www.youtube.com/feeds/videos.xml?channel_id=UCG4Hp1KbGw4e02N7FpPXDgQ"

output="$HOME/.local/tmp/RSS/$NAME.feed"
touch $output

	title=$(curl -s $FEED | grep "media:title" | grep -oP '(?<=\>).*?(?=\<)' | head -n 1)
	URL=$(curl -s $FEED | grep "media:content" | grep -oP '(?<=url=").*?(?=")' | head -n 1 | cut -d'?' -f1)
    echo "$NAME: $title" > $output
    echo -e "    URL: $URL\n" >> $output
    echo "$NAME: $title"
    echo -e "    URL: $URL" 
