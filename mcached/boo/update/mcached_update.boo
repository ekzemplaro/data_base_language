// -------------------------------------------------------------
//
//	mcached_update.boo
//
//						Oct/04/2011
// -------------------------------------------------------------
import System
import System.Collections

import Memcached.ClientLibrary


// -------------------------------------------------------------
print "*** 開始 ***"

id_in = argv[0]
population_in = int.Parse (argv[1])

print id_in,population_in

servers = ArrayList ()
servers.Add ("127.0.0.1:11211")

pool = SockIOPool.GetInstance()
pool.SetServers (servers)
pool.Initialize()

mc = MemcachedClient()

mcache_manipulate.update_proc (mc,id_in,population_in)

pool.Shutdown()

print "*** 終了 ***"

// -------------------------------------------------------------
