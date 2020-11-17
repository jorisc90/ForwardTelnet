on open location full_URL
	
	set the address to text ((offset of ":" in full_URL) + 3) thru -1 of full_URL
	set the hostname to text 1 thru ((offset of ":" in address) - 1) of address
	set the portnumber to text ((offset of ":" in address) + 1) thru -1 of address
		
	tell application "iTerm"
		activate
		if (count of windows) = 0 then
			set t to (create window with default profile)
		else
			set t to current window
		end if
		tell t
			create tab with default profile command "sh"
			set s to current session
			tell s
				set name to "%d"
				write text "exec /usr/local/bin/telnet " & hostname & " " & portnumber
			end tell
		end tell
	end tell

end open location