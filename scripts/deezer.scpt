on is_app_running(app_name)
	tell application "System Events" to (name of processes) contains app_name
end is_app_running

if is_app_running("Deezer") then
	tell application "Deezer"
		if (player state as text) is equal to "playing" then
			set track_name to the title of the (loaded track)
			set track_artist to the artist of the (loaded track)
			set now_playing to track_name & " - " & track_artist
            return now_playing
		end if
	end tell
end if
