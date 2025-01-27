#!/bin/bash
# set -x
export DISPLAY=:0
DIR="$HOME/.config/Conky"		
MODS="$DIR/modules"		
 M1="$MODS/min-date.conf"       #
 M2="$MODS/min-weather.conf"    #
# M3="$MODS/min-sys.conf"        #
# M4="$MODS/net-all.conf"        #
# M5="$MODS/net-up.conf"         #
# M6="$MODS/net-dn.conf"         #
# M7="$MODS/min-youtube.conf"    #
 M8="$MODS/bspwm-music.conf"

# # Set Theme
###################################
# USE wal colors Set THEME="Wal" / uncomment the following 2 lines
   wal="$HOME/.cache/wal/colors" 
   cp $wal $DIR/colors/Wal
# Set Wallpaper / Uncomment the following 2 lines
#      WALLPAPER="$DIR/Wallpapers/Gold-Brown-Anime.jpg"
#      feh --bg-fill $WALLPAPER

######
THEME="Wal"
######

# Get THEME
COLORS="$DIR/colors/$THEME"
CBG="$(sed -n '1p' $COLORS)"
C1="$(sed -n '2p' $COLORS)"
C2="$(sed -n '3p' $COLORS)"
C3="$(sed -n '4p' $COLORS)"
C4="$(sed -n '5p' $COLORS)"
C5="$(sed -n '6p' $COLORS)"
C6="$(sed -n '7p' $COLORS)"
C7="$(sed -n '8p' $COLORS)"
C8="$(sed -n '9p' $COLORS)"
B1="$(echo $C1 | sed 's/#//')"
B2="$(echo $C7 | sed 's/#//')"

for file in $MODS/*.conf; do
  sed -i "s/own_window_colour = '.*'/own_window_colour = '$CBG'/" "$file"
  sed -i "s/color1 = '.*'/color1 = '$C1'/" "$file"
  sed -i "s/color2 = '.*'/color2 = '$C2'/" "$file"
  sed -i "s/color3 = '.*'/color3 = '$C3'/" "$file"
  sed -i "s/color4 = '.*'/color4 = '$C4'/" "$file"
  sed -i "s/color5 = '.*'/color5 = '$C5'/" "$file"
  sed -i "s/color6 = '.*'/color6 = '$C6'/" "$file"
  sed -i "s/color7 = '.*'/color7 = '$C7'/" "$file"
  sed -i "s/color8 = '.*'/color8 = '$C8'/" "$file"
done

# check if conky is running and kill it then start conky else start conky
if pgrep -x "conky" > /dev/null
then
    pkill conky
    sleep 0.5
    conky -c $M8 &> $DIR/testing.log &
    conky -c $M1 &> $DIR/testing.log &
    sleep 1
else
    conky -c $M8 &> $DIR/testing.log &
    conky -c $M1 &> $DIR/testing.log &
    sleep 1
fi

exit
