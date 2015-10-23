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
	mcache_manipulate.data_put_proc (mc,"t1521","新潟",84932,"1968-8-18")
	mcache_manipulate.data_put_proc (mc,"t1522","長岡",62576,"1968-2-24")
	mcache_manipulate.data_put_proc (mc,"t1523","新発田",59798,"1968-9-17")
	mcache_manipulate.data_put_proc (mc,"t1524","上越",71469,"1968-10-5")
	mcache_manipulate.data_put_proc (mc,"t1525","糸魚川",32852,"1968-5-14")
	mcache_manipulate.data_put_proc (mc,"t1526","加茂",85654,"1968-7-17")
	mcache_manipulate.data_put_proc (mc,"t1527","三条",15876,"1968-1-26")
	mcache_manipulate.data_put_proc (mc,"t1528","佐渡",39842,"1968-5-21")
	mcache_manipulate.data_put_proc (mc,"t1529","柏崎",49757,"1968-7-19")
	mcache_manipulate.data_put_proc (mc,"t1530","村上",57632,"1968-9-20")
	mcache_manipulate.data_put_proc (mc,"t1531","十日町",32841,"1968-3-15")
	mcache_manipulate.data_put_proc (mc,"t1532","五泉",93562,"1968-8-7")

// ------------------------------------------------------------------
print "*** 開始 ***"
servers = ArrayList ()
servers.Add ("127.0.0.1:21201")

pool = SockIOPool.GetInstance()
pool.SetServers (servers)
pool.Initialize()

mc = MemcachedClient()


mcached_write_proc (mc)


pool.Shutdown()

print "*** 終了 ***"
// ------------------------------------------------------------------

// ------------------------------------------------------------------
