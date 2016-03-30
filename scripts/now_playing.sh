#!/bin/bash
# todo:
# add mocp
# cleanup osascript

NOW_PLAYING_DEEZER=$(osascript <<EOF
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

NOW_PLAYING_VLC=$(osascript <<EOF
tell application "System Events"
	set myList to (name of every process)
end tell

if myList contains "VLC" then
	tell application "VLC"
		if playing then
			set track_name to name of current item
			return "VLC is playing: #[bold]" & track_name & "#[nobold]"
		else
			return 1
		end if
	end tell
else
	return 1
end if
EOF)

if [ $NOW_PLAYING_DEEZER -eq 1 ]; then
    if [ $NOW_PLAYING_VLC -eq 1 ]; then
        # curl gds.fm
        GDS_PLAYING=$(curl -s http://gdsfm.airtime.pro/api/live-info-v2 | /usr/local/bin/jq -r '.tracks.current.name')
        echo "GDS.fm is playing: $GDS_PLAYING"
    else
        echo $NOW_PLAYING_VLC
    fi
else
    echo $NOW_PLAYING_DEEZER
fi
