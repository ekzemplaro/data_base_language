#! /usr/bin/lua
--
--	json_lua_read.lua
--
--					Nov/30/2009
--
--
--
--
--
file_in = "/var/tmp/json/cities.json"

-- ---------------------------------------------------------------------
--
print ("Content-type: text/json\n\n")

file, msg=io.open (file_in,"r")

if (file) then
	json_str = file:read ("*a")
	file:close ()
	print (json_str)
else
	print (msg)
end

--
--
