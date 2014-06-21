#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	ftp_read.lua
--
--					Apr/18/2013
-- ----------------------------------------------------
require	'json'
require	'text_manipulate'
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
