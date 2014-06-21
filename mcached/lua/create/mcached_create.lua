#! /usr/bin/lua
-- ----------------------------------------------------
--	mcached_create.lua
--
--				Oct/29/2013
--
-- ----------------------------------------------------
require 'Memcached'
require 'kvalue_manipulate'

-- ----------------------------------------------------
print ("*** 開始 ***")

local mem = Memcached.Connect('localhost', 11211)

record_out_proc (mem,"t1731","金沢",94173,"1981-5-18")
record_out_proc (mem,"t1732","輪島",32159,"1981-8-9")
record_out_proc (mem,"t1733","小松",72158,"1981-9-17")
record_out_proc (mem,"t1734","七尾",49317,"1981-3-22")
record_out_proc (mem,"t1735","珠洲",82653,"1981-7-11")
record_out_proc (mem,"t1736","加賀",38721,"1981-9-21")
record_out_proc (mem,"t1737","羽咋",42349,"1981-1-4")
record_out_proc (mem,"t1738","かほく",52486,"1981-9-21")
record_out_proc (mem,"t1739","白山",72561,"1981-2-5")


print ("*** 終了 ***")
-- ----------------------------------------------------

