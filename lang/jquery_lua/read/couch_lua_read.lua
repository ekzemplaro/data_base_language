#! /usr/bin/lua
--
--	couch_lua_read.lua
--
--						Nov/30/2010
--
--
--
--
--
require	'json_manipulate'
-- ----------------------------------------------------
print ("Content-type: text/json\n\n")

local http = require ("socket.http")
local ltn12 = require("ltn12")

local resp = {}
-- www.lua.orgにアクセス
-- sink(データの送り先)をテーブルに
-- 返値：応答、コード、ヘッダー

local rr,code,header = http.request{
	url = "http://host_couch:5984/city/cities",
	sink = ltn12.sink.table( resp ),
}
-- 上はhttp.request()関数を t[url]="http:...",t[sink]=ltn12...というテーブル tを引数に呼び出す時の書き方です --

json_str = table.concat (resp)

print (json_str)
-- ----------------------------------------------------------------
