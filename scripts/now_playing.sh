#!/bin/bash
# todo:
# add mocp
# cleanup osascript
NOW_PLAYING=$(osascript ~/dotfiles/scripts/now_playing.scpt)

if [ $NOW_PLAYING -eq 1 ]; then
    # curl gds.fm
    GDS_PLAYING=$(curl -s http://gdsfm.airtime.pro/api/live-info-v2 | /usr/local/bin/jq -r '.tracks.current.name')
    echo "GDS.fm is playing: $GDS_PLAYING"
else
    echo $NOW_PLAYING
fi
