#! /usr/bin/lua
-- ----------------------------------------------------
--	mcached_read.lua
--
--					Sep/16/2010
-- ----------------------------------------------------
require	'Memcached'
require	'kvalue_manipulate'

-- ----------------------------------------------------
print ("*** 開始 ***")

memcache = Memcached.Connect('localhost', 11211)

keys = {"t1731","t1732","t1733",
	"t1734","t1735","t1736",
	"t1737","t1738","t1739"}

for kk, key in pairs (keys) do
	disp_proc (memcache,key)
end


print ("*** 終了 ***")

-- ----------------------------------------------------
