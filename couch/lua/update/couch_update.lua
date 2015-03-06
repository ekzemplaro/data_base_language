#! /usr/bin/lua
-- ----------------------------------------------------
--	couch_update.lua
--
--					Feb/16/2015
-- ----------------------------------------------------
require	'json'
require	'text_manipulate'

http = require ("socket.http")
-- ----------------------------------------------------
function rest_put_proc (url_aa,value)
	local response_body = {}
	local response_to_discard = nil
	local response_status = nil
	local response_headers = nil
	local response_status_line = nil

	response_to_discard, response_status, response_headers,
		 response_status_line = http.request({
		url = url_aa,
		method = "PUT",
		headers = {
			["Authorization"] = access_key_id,
			["Content-Length"] = string.len (value),
			["Content-Type"] = "plain/text"
			},
		source = ltn12.source.string (value),
		sink = ltn12.sink.table(response_body)
	})
end

-- ----------------------------------------------------
print ("*** 開始 ***")

local key_in= arg[1]
local population_in= 0 + arg[2]

print (key_in,population_in)

local url_base = "http://localhost:5984/nagano"
local url_aa = url_base .. "/" .. key_in
local json_str = http.request (url_aa)
local unit_aa = json.decode (json_str)

print (json_str)

print (unit_aa.name)
print (unit_aa.population)
print (unit_aa.date_mod)

unit_aa.population = population_in
unit_aa.date_mod = get_current_date_proc ()
local json_str_new = json.encode (unit_aa)
print (json_str_new)

rest_put_proc (url_aa,json_str_new)


print ("*** 終了 ***")
-- ----------------------------------------------------

