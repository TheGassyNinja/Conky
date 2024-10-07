#!/bin/bash
set -x
DIR="$HOME/.config/conky"

# use fzf to offer theme choices from colors in $DIR/colors
THEME=$(ls $DIR/colors | fzf)

SET="$(echo "THEME=\"$THEME\"")"

# use sed to replace the current THEME in conky-*.sh files
for file in $DIR/conky-*.sh; do
  sed -i "s/^THEME=.*$/$SET/" "$file"
done


