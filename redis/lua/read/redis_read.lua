-- ----------------------------------------------------
--	redis_read.lua
--
--					Feb/13/2015
-- ----------------------------------------------------
require	('text_manipulate')
require	('redis_manipulate')
-- ----------------------------------------------------
print ("*** 開始 ***")

local server_host = "host_dbase"
local server_port = 6379

dict_aa = redis_to_dict_proc (server_host,server_port)

dict_display_proc (dict_aa)

print ("*** 終了 ***")
-- ----------------------------------------------------
