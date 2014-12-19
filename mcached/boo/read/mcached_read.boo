// ------------------------------------------------------------------
//	mcached_read.boo
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
servers.Add ("127.0.0.1:11211")

pool = SockIOPool.GetInstance()
pool.SetServers (servers)
pool.Initialize()

mc = MemcachedClient()

keys = ["t1731","t1732","t1733","t1734","t1735","t1736","t1737","t1738","t1739"]

for key in keys:
	if (mc.KeyExists (key)):
		json_str = mc.Get(key)

		if (json_str != null):
			print json_str
#			kvalue_manipulate.out_record_proc (key,json_str)

pool.Shutdown()

print "*** 終了 ***"


// ------------------------------------------------------------------
