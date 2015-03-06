-- ----------------------------------------------------
--	redis_create.lua
--
--				Feb/13/2015
--
-- ----------------------------------------------------
require	('text_manipulate')
require	('redis_manipulate')
-- ----------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t1851","福井",29175,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t1852","敦賀",72154,"1981-2-5")
	dict_aa = dict_append_proc (dict_aa,"t1853","小浜",52643,"1981-7-24")
	dict_aa = dict_append_proc (dict_aa,"t1854","大野",47329,"1981-3-22")
	dict_aa = dict_append_proc (dict_aa,"t1855","勝山",82178,"1981-7-11")
	dict_aa = dict_append_proc (dict_aa,"t1856","鯖江",38567,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t1857","あわら",49536,"1981-1-4")
	dict_aa = dict_append_proc (dict_aa,"t1858","越前",53841,"1981-10-21")
	dict_aa = dict_append_proc (dict_aa,"t1859","坂井",91326,"1981-3-18")

	return	dict_aa
end
-- ----------------------------------------------------
print ("*** 開始 ***")

dict_aa = data_prepare_proc ()

local server_host = "host_dbase"
local server_port = 6379

local socket = require('socket')

local client = socket.connect (server_host,server_port)

for key in pairs (dict_aa)  do
	local unit_aa = dict_aa[key]
	redis_set_value_proc (client,key,unit_aa)
end

client:close()

print ("*** 終了 ***")
-- ----------------------------------------------------

