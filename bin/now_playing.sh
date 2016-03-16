#!/bin/bash
NOW_PLAYING=$(osascript <<EOF
set deezer_state to false

if is_app_running("Deezer") then
    tell application "Deezer" to set deezer_state to (player state as text)
end if

if deezer_state is equal to "playing" then
    tell application "Deezer"
		set track_name to the title of the (loaded track)
		set track_artist to the artist of the (loaded track)
        return "Deezer is playing: #[bold]" & track_name & "#[nobold] by #[bold]" & track_artist & "#[nobold]"
    end tell
else
    return 1
end if

on is_app_running(app_name)
    tell application "System Events" to (name of processes) contains app_name
end is_app_running
EOF)

if [ $NOW_PLAYING -eq 1 ]; then
    # curl gds.fm
    GDS_PLAYING=$(curl -s http://gdsfm.airtime.pro/api/live-info-v2 | /usr/local/bin/jq -r '.tracks.current.name')
    echo "GDS.fm is playing: $GDS_PLAYING"
else
    echo $NOW_PLAYING
fi
