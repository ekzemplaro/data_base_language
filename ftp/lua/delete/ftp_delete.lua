#! /usr/bin/lua
-- ----------------------------------------------------
--	ftp_delete.lua
--
--					Dec/19/2014
-- ----------------------------------------------------
require	'json'
require	'text_manipulate'
-- ----------------------------------------------------
print ("*** 開始 ***")

id_in=arg[1]

print (id_in)

local ftp = require ("socket.ftp")

local resp = {}

url="ftp://scott:tiger@host_dbase/city/iwate.json"
json_str, ee = ftp.get (url)

-- print	(json_str)

dict_aa = json.decode(json_str)

dict_bb = dict_delete_proc (dict_aa,id_in)

dict_display_proc (dict_bb)

str_json = json.encode (dict_bb)

ee = ftp.put (url,str_json)

print ("*** 終了 ***")
-- ----------------------------------------------------

