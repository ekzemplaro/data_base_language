#! /usr/bin/lua
-- ----------------------------------------------------
--	basex_read.lua
--
--					Feb/02/2012
-- ----------------------------------------------------
require ('LuaXml')
require ('xml_manipulate')

-- ----------------------------------------------------
print ("*** 開始 ***")

local http = require ("socket.http")

local resp = {}

local rr,code,header = http.request{
	url = "http://admin:admin@localhost:8984/rest/cities?query=/",
	sink = ltn12.sink.table( resp ),
}

xml_str = table.concat (resp)
-- print (xml_str)

xml_string_display (xml_str)

print ("*** 終了 ***")
-- ----------------------------------------------------

