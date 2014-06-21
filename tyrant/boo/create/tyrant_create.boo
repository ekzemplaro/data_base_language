// ------------------------------------------------------------------
//	tyrant_create.boo
//
//					Oct/04/2011
//
// ------------------------------------------------------------------
import System
import System.Collections

import Memcached.ClientLibrary

// ------------------------------------------------------------------
def mcached_write_proc (mc as MemcachedClient):
	mcache_manipulate.data_put_proc (mc,"t4761","那覇",84732,"1968-2-18")
	mcache_manipulate.data_put_proc (mc,"t4762","宜野湾",62576,"1968-5-24")
	mcache_manipulate.data_put_proc (mc,"t4763","石垣",59791,"1968-9-17")
	mcache_manipulate.data_put_proc (mc,"t4764","浦添",71469,"1968-10-5")
	mcache_manipulate.data_put_proc (mc,"t4765","名護",32858,"1968-5-14")
	mcache_manipulate.data_put_proc (mc,"t4766","糸満",85654,"1968-7-17")
	mcache_manipulate.data_put_proc (mc,"t4767","沖縄",15876,"1968-1-26")
	mcache_manipulate.data_put_proc (mc,"t4768","豊見城",39843,"1968-5-21")
	mcache_manipulate.data_put_proc (mc,"t4769","うるま",49757,"1968-7-19")

// ------------------------------------------------------------------
print "*** 開始 ***"
servers = ArrayList ()
servers.Add ("127.0.0.1:1978")

pool = SockIOPool.GetInstance()
pool.SetServers (servers)
pool.Initialize()

mc = MemcachedClient()


mcached_write_proc (mc)


pool.Shutdown()

print "*** 終了 ***"
// ------------------------------------------------------------------

// ------------------------------------------------------------------
