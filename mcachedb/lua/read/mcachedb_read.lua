#! /usr/bin/lua
-- ----------------------------------------------------
--	mcachedb_read.lua
--
--					Feb/16/2015
-- ----------------------------------------------------
json=require	('json')
require	('text_manipulate')
require	('mcached_manipulate')

-- ----------------------------------------------------
print ("*** 開始 ***")

local server_host = "host_ubuntu1"
local server_port = 21201

keys = {"t1521","t1522","t1523",
	"t1524","t1525","t1526",
	"t1527","t1528","t1529",
	"t1530","t1531","t1532"}

dict_aa = mcached_to_dict_proc (server_host,server_port,keys)

dict_display_proc (dict_aa)

print ("*** 終了 ***")

-- ----------------------------------------------------
