#! /usr/bin/lua
-- ----------------------------------------------------
--	webdav_read.lua
--
--				Jan/23/2012
--
-- ----------------------------------------------------
require	'text_manipulate'
-- ----------------------------------------------------
require 'curl'
require 'json'

print ("*** 開始 ***")

local buffer = {}
cc = curl.easy_init()

url = 'http://172.20.129.189:3004/city/tokyo.json'
cc:setopt(curl.OPT_URL,url)

cc:setopt(curl.OPT_WRITEFUNCTION,function (s, len) buffer[#buffer+1] = s return len end)
cc:perform()

json_str = table.concat( buffer )

-- print( json_str)

dict_aa = json.decode(json_str)
dict_display_proc (dict_aa)

print ("*** 終了 ***")

-- ----------------------------------------------------
