#!/bin/bash
set -x
DIR="$(pwd)"		
MODS="$DIR/modules"		
M1="$MODS/TEMPLATE.conf"


# Harvest wal colors
#   wal="$HOME/.cache/wal/colors" 
#   cp $wal $DIR/colors/Wal

# # Set Theme
###################################

THEME="Wal"
WALLPAPER="$DIR/Wallpapers/The-Fern.jpeg"
      feh --bg-fill $WALLPAPER

###################################


# Get THEME
COLORS="$DIR/colors/$THEME"
C1="$(sed -n '2p' $COLORS)"
C2="$(sed -n '3p' $COLORS)"
C3="$(sed -n '4p' $COLORS)"
C4="$(sed -n '5p' $COLORS)"
C5="$(sed -n '6p' $COLORS)"
C6="$(sed -n '7p' $COLORS)"
C7="$(sed -n '8p' $COLORS)"
C8="$(sed -n '9p' $COLORS)"

# Update $M1 with theme colors
sed -i "s/color1 = '.*'/color1 = '$C1'/" $M1
sed -i "s/color2 = '.*'/color2 = '$C2'/" $M1
sed -i "s/color3 = '.*'/color3 = '$C3'/" $M1
sed -i "s/color4 = '.*'/color4 = '$C4'/" $M1
sed -i "s/color5 = '.*'/color5 = '$C5'/" $M1
sed -i "s/color6 = '.*'/color6 = '$C6'/" $M1
sed -i "s/color7 = '.*'/color7 = '$C7'/" $M1
sed -i "s/color8 = '.*'/color8 = '$C8'/" $M1


if pgrep -x "conky" > /dev/null
 then
    pkill -x "conky"
    sleep 1
      conky -c $M1 &> $DIR/testing.log &
 
fi

exit