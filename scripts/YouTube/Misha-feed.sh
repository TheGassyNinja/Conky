#!/bin/bash
# Misha Charoudin	    https://www.youtube.com/@mgcharoudin        # UCZ2eIJY0phalm_MG38kE26A
NAME="Misha"
FEED="https://www.youtube.com/feeds/videos.xml?channel_id=UCZ2eIJY0phalm_MG38kE26A"

output="$HOME/.local/tmp/RSS/$NAME.feed"
touch $output
	title=$(curl -s $FEED | grep "media:title" | grep -oP '(?<=\>).*?(?=\<)' | head -n 1)
	URL=$(curl -s $FEED | grep "media:content" | grep -oP '(?<=url=").*?(?=")' | head -n 1 | cut -d'?' -f1)
    echo "$NAME: $title" > $output
    echo -e "    URL: $URL\n" >> $output
    echo "$NAME: $title"
    echo "    URL: $URL" 
