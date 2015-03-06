#! /usr/bin/lua
-- ----------------------------------------------------
--	couch_delete.lua
--
--					Feb/16/2015
-- ----------------------------------------------------
require	'json'
require	'text_manipulate'

http = require ("socket.http")
-- ----------------------------------------------------
function rest_delete_proc (url_aa)
	local response_body = {}
	local response_to_discard = nil
	local response_status = nil
	local response_headers = nil
	local response_status_line = nil

	response_to_discard, response_status, response_headers,
		 response_status_line = http.request({
		url = url_aa,
		method = "DELETE",
		headers = {
--			["Authorization"] = access_key_id,
--			["Content-Length"] = string.len (value),
--			["Content-Type"] = "plain/text"
			},
--		source = ltn12.source.string (value),
		sink = ltn12.sink.table(response_body)
	})
end

-- ----------------------------------------------------
print ("*** 開始 ***")

local key_in= arg[1]

print (key_in)

local url_base = "http://localhost:5984/nagano"
local url_aa = url_base .. "/" .. key_in
local json_str = http.request (url_aa)
local unit_aa = json.decode (json_str)

print (json_str)

print (unit_aa.name)
print (unit_aa.population)
print (unit_aa.date_mod)


rest_delete_proc (url_aa)


print ("*** 終了 ***")
-- ----------------------------------------------------

