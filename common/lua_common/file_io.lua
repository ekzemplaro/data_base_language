-- ----------------------------------------------------
--	file_io.lua
--
--					May/27/2011
-- ----------------------------------------------------
function file_to_str_proc (file_in)
	file, msg=io.open (file_in,"r")

	if (file) then
		str_in = file:read ("*a")
		file:close ()
	else
		print (msg)
	end

	return	str_in
end
-- ----------------------------------------------------
-- ----------------------------------------------------
