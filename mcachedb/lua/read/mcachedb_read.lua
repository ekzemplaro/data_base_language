#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	mcachedb_read.lua
--
--					Apr/02/2013
-- ----------------------------------------------------
require	'Memcached'
require	'kvalue_manipulate'

-- ----------------------------------------------------
print ("*** 開始 ***")

memcache = Memcached.Connect('localhost', 21201)

keys = {"t1521","t1522","t1523",
	"t1524","t1525","t1526",
	"t1527","t1528","t1529",
	"t1530","t1531","t1532"}

for kk, key in pairs (keys) do
	disp_proc (memcache,key)
end

print ("*** 終了 ***")

-- ----------------------------------------------------
