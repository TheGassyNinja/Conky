#!/bin/bash


output="$HOME/.local/tmp/RSS/$NAME.feed"
touch $output

	title=$(curl -s $FEED | grep "media:title" | grep -oP '(?<=\>).*?(?=\<)' | head -n 1)
    echo "$NAME: $title" > $output
    echo "$NAME: $title"
