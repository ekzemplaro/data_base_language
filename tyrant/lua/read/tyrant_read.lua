#! /usr/bin/lua5.1
-- ----------------------------------------------------
--	tyrant_read.lua
--
--					Sep/16/2010
-- ----------------------------------------------------
require	'Memcached'
require	'kvalue_manipulate'

-- ----------------------------------------------------
print ("*** 開始 ***")

memcache = Memcached.Connect('localhost', 1978)

keys = {"t4761","t4762","t4763",
	"t4764","t4765","t4766",
	"t4767","t4768","t4769"}

for kk, key in pairs (keys) do
	disp_proc (memcache,key)
end


print ("*** 終了 ***")

-- ----------------------------------------------------
