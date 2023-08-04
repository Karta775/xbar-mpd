#!/usr/bin/env bash

# User configuration
LENGTH_LIM=30       # xbar output limit (if it's too long then xbar won't output anything)
ARTIST_LIM=14       # Artist name limit
SKIP_LOWERCASE=true # Skip lower case letters in artist acronym?

# Variables
title_lim=$((LENGTH_LIM - ARTIST_LIM))
track="$(/opt/homebrew/bin/mpc -f '%artist% - %title%' current)"
title="$(echo $track | sed 's/.*-\ //')"
artist="$(echo $track | sed 's/\ -.*//')"

# Acronymize the artist if it's too long
if [ ${#artist} -gt $ARTIST_LIM ] || [ ${#title} -gt $title_lim ]; then
  arist_short=""
  for word in $artist; do
    initial="$(echo $word | cut -c1-1)"
    $SKIP_LOWERCASE && [[ "$initial" =~ [a-z] ]] && continue
    artist_short+="$initial"
  done
fi

# Set text color to gray if the track is paused
xbar_options=" | length=$LENGTH_LIM "
if ! /opt/homebrew/bin/mpc status | tail -2 | grep -q "playing"; then
  xbar_options+="color=#555555"
fi

# Final output
echo -e "${artist_short:-$artist} - $title ${xbar_options}"
