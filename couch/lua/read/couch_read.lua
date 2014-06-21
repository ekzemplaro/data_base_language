#! /usr/bin/lua
-- ----------------------------------------------------
--	couch_read.lua
--
--					Jul/16/2011
-- ----------------------------------------------------
require	'json'
require	'text_manipulate'
-- ----------------------------------------------------
print ("*** 開始 ***")

local http = require ("socket.http")
local ltn12 = require("ltn12")

local resp = {}
-- www.lua.orgにアクセス
-- sink(データの送り先)をテーブルに
-- 返値：応答、コード、ヘッダー

local rr,code,header = http.request{
	url = "http://host_dbase:5984/city/cities",
	sink = ltn12.sink.table( resp ),
}
-- 上はhttp.request()関数を t[url]="http:...",t[sink]=ltn12...というテーブル tを引数に呼び出す時の書き方です --

json_str = table.concat (resp)

-- print	(json_str)

dict_aa = json.decode(json_str)
dict_display_proc (dict_aa)
print ("*** 終了 ***")
-- ----------------------------------------------------

