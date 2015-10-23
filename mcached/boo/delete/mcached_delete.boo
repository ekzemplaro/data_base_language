// -------------------------------------------------------------
//
//	mcached_delete.boo
//
//						Oct/04/2011
// -------------------------------------------------------------
import System
import System.Collections

import Memcached.ClientLibrary


// -------------------------------------------------------------
print "*** 開始 ***"

key = argv[0]

print key

servers = ArrayList ()
servers.Add ("127.0.0.1:11211")

pool = SockIOPool.GetInstance()
pool.SetServers (servers)
pool.Initialize()

mc = MemcachedClient()

if (mc.KeyExists(key)):
	mc.Delete (key)

pool.Shutdown()

print "*** 終了 ***"

// -------------------------------------------------------------
