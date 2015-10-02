#! /usr/bin/lua
-- ----------------------------------------------------
--	tyrant_read.lua
--
--					Feb/16/2015
-- ----------------------------------------------------
json=require	('json')
require	('text_manipulate')
require	('mcached_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

keys = {"t4761","t4762","t4763",
	"t4764","t4765","t4766",
	"t4767","t4768","t4769"}

local server_host = "host_ubuntu"
local server_port = 1978

dict_aa = mcached_to_dict_proc (server_host,server_port,keys)

dict_display_proc (dict_aa)

print ("*** 終了 ***")

-- ----------------------------------------------------
