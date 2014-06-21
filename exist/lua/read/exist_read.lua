#! /usr/bin/lua
-- ----------------------------------------------------
--	exist_read.lua
--
--					Sep/25/2011
-- ----------------------------------------------------
require ('LuaXml')
require ('xml_manipulate')

-- ----------------------------------------------------
print ("*** 開始 ***")

local http = require ("socket.http")

local resp = {}

local rr,code,header = http.request{
	url = "http://cpt003:8086/exist/rest/db/cities/cities.xml",
	sink = ltn12.sink.table( resp ),
}

xml_str = table.concat (resp)
-- print (xml_str)

xml_string_display (xml_str)

print ("*** 終了 ***")
-- ----------------------------------------------------

