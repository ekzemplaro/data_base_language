-- ----------------------------------------------------
--	redis_create.lua
--
--				Apr/18/2013
--
-- ----------------------------------------------------
require	('text_manipulate')
-- ----------------------------------------------------
function data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc (dict_aa,"t1851","福井",89175,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t1852","敦賀",72154,"1981-2-5")
	dict_aa = dict_append_proc (dict_aa,"t1853","小浜",53643,"1981-7-24")
	dict_aa = dict_append_proc (dict_aa,"t1854","大野",41329,"1981-3-22")
	dict_aa = dict_append_proc (dict_aa,"t1855","勝山",86178,"1981-7-11")
	dict_aa = dict_append_proc (dict_aa,"t1856","鯖江",38527,"1981-9-21")
	dict_aa = dict_append_proc (dict_aa,"t1857","あわら",49536,"1981-1-4")
	dict_aa = dict_append_proc (dict_aa,"t1858","越前",57841,"1981-10-21")
	dict_aa = dict_append_proc (dict_aa,"t1859","坂井",85326,"1981-3-18")

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
	local value = dict_aa[key]
	json = require("json")
	local str_json = json.encode (value)
	local command = "set " .. key .. " " .. str_json .. "\r\n"
	client:send(command)
	ret_0 = client:receive()
	print (ret_0)
end

client:close()

print ("*** 終了 ***")
-- ----------------------------------------------------

