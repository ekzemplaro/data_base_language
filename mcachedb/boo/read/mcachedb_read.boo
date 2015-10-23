// ------------------------------------------------------------------
//	mcachedb_read.boo
//
//					Oct/04/2011
//
// ------------------------------------------------------------------
import System
import System.Collections

import Memcached.ClientLibrary

// ------------------------------------------------------------------
print "*** 開始 ***"
servers = ArrayList ()
servers.Add ("127.0.0.1:21201")

pool = SockIOPool.GetInstance()
pool.SetServers (servers)
pool.Initialize()

mc = MemcachedClient()

keys = ["t1521","t1522","t1523","t1524","t1525","t1526","t1527", \
		"t1528","t1529","t1530","t1531","t1532"]

for key in keys:
	if (mc.KeyExists (key)):
		json_str = mc.Get(key)

		if (json_str != null):
			kvalue_manipulate.out_record_proc (key,json_str)

pool.Shutdown()

print "*** 終了 ***"


// ------------------------------------------------------------------
