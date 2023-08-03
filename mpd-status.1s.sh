#!/usr/bin/env bash

TITLE_LIM=24        # Title length limit
ARTIST_LIM=14       # Artist length limit
SKIP_LOWERCASE=true # Skip lower case letters in artist acronym?

track="$(/opt/homebrew/bin/mpc -f '%artist% - %title%' current)"
title="$(echo $track | sed 's/.*-\ //')"
artist="$(echo $track | sed 's/\ -.*//')"

# Acronymize the artist if it's too long ('King Gizzard and the Lizard Wizard' -> 'KGLW')
if [ ${#artist} -gt $ARTIST_LIM ]; then
  arist_short=""
  for word in $artist; do
    initial="$(echo $word | cut -c1-1)"
    [ ! $SKIP_LOWERCASE ] && [[ "$initial" =~ [a-z] ]] && continue
    artist_short+="$initial"
  done
fi

# If the track is currently playing
if /opt/homebrew/bin/mpc status | tail -2 | grep -q "playing"; then
  xbar_options=""
else
  xbar_options="| color=#555555"
fi

echo -e "${artist_short:-$artist} - $title ${xbar_options}"
