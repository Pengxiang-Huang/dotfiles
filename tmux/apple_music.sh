#!/usr/bin/env osascript
-- Returns the currently playing song in Apple Music for macOS

tell application "Music"
    if it is running then
        if player state is playing then
            set track_name to name of current track
            set artist_name to artist of current track
            set album_name to album of current track

            if artist_name is not "" then
                -- Format output with song details
                set now_playing to "♫  " & artist_name & " - " & track_name

                -- Truncate long song titles
                if length of now_playing > 35 then
                    return text 1 thru 35 of now_playing & "..."
                else
                    return now_playing
                end if
            else
                return "~ " & track_name -- Handle unknown artist
            end if
        else
            return "Paused ⏸"
        end if
    else
        return "No Music Playing"
    end if
end tell
