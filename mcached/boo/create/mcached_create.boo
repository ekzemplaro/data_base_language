// ------------------------------------------------------------------
//	mcached_create.boo
//
//					Oct/04/2011
//
// ------------------------------------------------------------------
import System
import System.Collections

import Memcached.ClientLibrary

// ------------------------------------------------------------------
def mcached_write_proc (mc as MemcachedClient):
	mcache_manipulate.data_put_proc (mc,"t1731","金沢",54938,"1968-6-18")
	mcache_manipulate.data_put_proc (mc,"t1732","輪島",62576,"1968-2-24")
	mcache_manipulate.data_put_proc (mc,"t1733","小松",59798,"1968-9-17")
	mcache_manipulate.data_put_proc (mc,"t1734","七尾",71469,"1968-10-5")
	mcache_manipulate.data_put_proc (mc,"t1735","珠洲",32852,"1968-5-14")
	mcache_manipulate.data_put_proc (mc,"t1736","加賀",85654,"1968-7-17")
	mcache_manipulate.data_put_proc (mc,"t1737","羽咋",15876,"1968-1-26")
	mcache_manipulate.data_put_proc (mc,"t1738","かほく",39842,"1968-5-21")
	mcache_manipulate.data_put_proc (mc,"t1739","白山",49757,"1968-7-19")

// ------------------------------------------------------------------
print "*** 開始 ***"
servers = ArrayList ()
servers.Add ("127.0.0.1:11211")

pool = SockIOPool.GetInstance()
pool.SetServers (servers)
pool.Initialize()

mc = MemcachedClient()


mcached_write_proc (mc)


pool.Shutdown()

print "*** 終了 ***"
// ------------------------------------------------------------------

// ------------------------------------------------------------------
