#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	mcachedb_create.lua
--
--				Apr/02/2013
--
-- ----------------------------------------------------
require 'Memcached'
require 'kvalue_manipulate'

-- ----------------------------------------------------
print ("*** 開始 ***")

local mem = Memcached.Connect('localhost', 21201)

record_out_proc (mem,"t1521","新潟",94176,"1981-9-18")
record_out_proc (mem,"t1522","長岡",32157,"1981-2-9")
record_out_proc (mem,"t1523","新発田",72139,"1981-5-17")
record_out_proc (mem,"t1524","上越",49328,"1981-10-22")
record_out_proc (mem,"t1525","糸魚川",82415,"1981-7-11")
record_out_proc (mem,"t1526","加茂",38762,"1981-9-21")
record_out_proc (mem,"t1527","三条",42381,"1981-1-4")
record_out_proc (mem,"t1528","佐渡",58429,"1981-9-21")
record_out_proc (mem,"t1529","柏崎",72651,"1981-2-5")
record_out_proc (mem,"t1530","村上",41937,"1981-4-25")
record_out_proc (mem,"t1531","十日町",83712,"1981-7-12")
record_out_proc (mem,"t1532","五泉",34591,"1981-9-9")


print ("*** 終了 ***")
-- ----------------------------------------------------

