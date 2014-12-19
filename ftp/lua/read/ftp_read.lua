#! /usr/bin/lua
-- ----------------------------------------------------
--	ftp_read.lua
--
--					Apr/18/2013
-- ----------------------------------------------------
require	'text_manipulate'
require	'json'
-- ----------------------------------------------------
print ("*** 開始 ***")

local ftp = require ("socket.ftp")

local resp = {}

json_str, ee = ftp.get ("ftp://scott:tiger@host_dbase/city/iwate.json")

-- print	(json_str)

dict_aa = json.decode(json_str)
dict_display_proc (dict_aa)
print ("*** 終了 ***")
-- ----------------------------------------------------
