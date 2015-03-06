#! /usr/bin/lua
-- ----------------------------------------------------
--	mcached_read.lua
--
--					Feb/16/2015
-- ----------------------------------------------------
json=require	('json')
require	('text_manipulate')
require	('mcached_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

local server_host = "localhost"
local server_port = 11211

keys = {"t1731","t1732","t1733",
	"t1734","t1735","t1736",
	"t1737","t1738","t1739"}

dict_aa = mcached_to_dict_proc (server_host,server_port,keys)

dict_display_proc (dict_aa)

print ("*** 終了 ***")
-- ----------------------------------------------------
