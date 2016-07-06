set now_playing to 1

on is_app_running(app_name)
	tell application "System Events" to (name of processes) contains app_name
end is_app_running

if is_app_running("VLC") then
	tell application "VLC"
		if playing is equal to true then
			set track_name to name of current item
			set now_playing to "VLC is playing: #[bold]" & track_name & "#[nobold]"
		end if
	end tell
end if

if is_app_running("Deezer") then
	tell application "Deezer"
		if (player state as text) is equal to "playing" then
			set track_name to the title of the (loaded track)
			set track_artist to the artist of the (loaded track)
			set now_playing to "Deezer is playing: #[bold]" & track_name & "#[nobold] by #[bold]" & track_artist & "#[nobold]"
		end if
	end tell
end if

return now_playing
