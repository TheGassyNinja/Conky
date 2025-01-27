#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#  	Config:
#  	Spawned: Sun Jan 19 2025 - 04:24
#  	Last Mod: Mon Jan 20 2025 - 04:26
#  	Depends:
#  	Note:
        #  dbus-send --session --dest=org.freedesktop.DBus --type=method_call \
        #    --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | \
        #    grep org.mpris.MediaPlayer2
 

#!/usr/bin/env bash

OUTPUT_FILE="$HOME/.local/tmp/currently_playing.txt"
mkdir -p "$(dirname "$OUTPUT_FILE")"
echo -n "" > "$OUTPUT_FILE"

DBUS=$(dbus-send --session --dest=org.freedesktop.DBus --type=method_call \
    --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | \
    grep org.mpris.MediaPlayer2 | awk -F '"' '{print $2}' | sed 's/org.mpris.MediaPlayer2.//g')

for player in $DBUS; do
    status=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.$player \
        /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
        string:"org.mpris.MediaPlayer2.Player" string:"PlaybackStatus" \
        | awk -F '"' '/string/ {print $2}')
    
    if [[ "$status" == "Playing" ]]; then
        # Get metadata
        metadata=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.$player \
            /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
            string:"org.mpris.MediaPlayer2.Player" string:"Metadata")

        title=$(echo "$metadata" | grep -A 1 "xesam:title" | tail -n 1 | awk -F '"' '{print $2}')
        artist=$(echo "$metadata" | grep -A 2 "xesam:artist" | tail -n 1 | awk -F '"' '{print $2}')
        album=$(echo "$metadata" | grep -A 1 "xesam:album" | tail -n 1 | awk -F '"' '{print $2}')

        echo "$player: $title by $artist from $album" >> "$OUTPUT_FILE"
    fi
done

