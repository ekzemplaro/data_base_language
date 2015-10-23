// ------------------------------------------------------------------
//	tyrant_read.boo
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
servers.Add ("127.0.0.1:1978")

pool = SockIOPool.GetInstance()
pool.SetServers (servers)
pool.Initialize()

mc = MemcachedClient()

keys = ["t4761","t4762","t4763","t4764","t4765","t4766","t4767","t4768","t4769"]

for key in keys:
	if (mc.KeyExists (key)):
		json_str = mc.Get(key)

		if (json_str != null):
			kvalue_manipulate.out_record_proc (key,json_str)

pool.Shutdown()

print "*** 終了 ***"


// ------------------------------------------------------------------
