#! /usr/bin/lua
-- ----------------------------------------------------
--	neo4j_read.lua
--
--					Oct/11/2011
-- ----------------------------------------------------
-- require	'json_manipulate'
-- ----------------------------------------------------
function json_row_out_proc (result)
	out_str = result.id .. "\t"
	out_str = out_str .. result.name .. "\t"
	out_str = out_str .. result.population .. "\t"
	out_str = out_str .. result.date_mod
	print (out_str)
end
-- ----------------------------------------------------
function row_parser (key)
	local http = require ("socket.http")
	local ltn12 = require("ltn12")

	local resp = {}
	local rr,code,header = http.request{
	url = "http://localhost:7474/db/data/node/" .. key .. "/properties",
		sink = ltn12.sink.table( resp ),
	}

	json_str = table.concat (resp)

	json = require("json")
	result = json.decode(json_str)

	json_row_out_proc (result)

end

-- ----------------------------------------------------
print ("*** 開始 ***")

for key=31,39 do
	row_parser (key)
end

--- json_disp_proc (json_str)
print ("*** 終了 ***")
-- ----------------------------------------------------

