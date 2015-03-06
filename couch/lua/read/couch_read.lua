#! /usr/bin/lua
-- ----------------------------------------------------
--	couch_read.lua
--
--					Feb/16/2015
-- ----------------------------------------------------
require	'json'
require	'text_manipulate'

http = require ("socket.http")
-- ----------------------------------------------------
function couch_to_dict_proc (url_base)
	local url_all = url_base .. "/_all_docs"

	local json_str = http.request (url_all)

	data_aa = json.decode (json_str)

	for it,value in pairs (data_aa.rows)
		do
			url_aa = url_base .. "/" .. value.key
			json_str = http.request (url_aa)
			unit_aa = json.decode (json_str)
			dict_aa = dict_append_proc
				(dict_aa,value.key,unit_aa.name,
				unit_aa.population,unit_aa.date_mod)
		end

	return	dict_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")

dict_aa = {}

local url_base = "http://localhost:5984/nagano"

local dict_aa = couch_to_dict_proc (url_base)

dict_display_proc (dict_aa)
print ("*** 終了 ***")
-- ----------------------------------------------------

