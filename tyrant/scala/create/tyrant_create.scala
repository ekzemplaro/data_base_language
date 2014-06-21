// --------------------------------------------------------------
//	create/tyrant_create.scala
//
//					Mar/15/2012
// --------------------------------------------------------------
import com.danga.MemCached.SockIOPool
import com.danga.MemCached.MemCachedClient
 
// --------------------------------------------------------------
object tyrant_create
{
 
// --------------------------------------------------------------
def main (args: Array [String])
{
	println ("*** 開始 ***")
 
	val serverlist = Array ("localhost:1978")
	val pool: SockIOPool = SockIOPool.getInstance()
	pool.setServers(serverlist)
	pool.initialize()

	mcached_write_proc ()

	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
def mcached_write_proc ()
{
	val mc: MemCachedClient = new MemCachedClient()

	mcached_manipulate.data_put_proc (mc,"t4761","那覇",92574,"1998-8-11")
	mcached_manipulate.data_put_proc (mc,"t4762","宜野湾",28451,"1998-2-21")
	mcached_manipulate.data_put_proc (mc,"t4763","石垣",74329,"1998-7-7")
	mcached_manipulate.data_put_proc (mc,"t4764","浦添",71268,"1998-11-15")
	mcached_manipulate.data_put_proc (mc,"t4765","名護",32459,"1998-9-14")
	mcached_manipulate.data_put_proc (mc,"t4766","糸満",61584,"1998-7-17")
	mcached_manipulate.data_put_proc (mc,"t4767","沖縄",24576,"1998-1-26")
	mcached_manipulate.data_put_proc (mc,"t4768","豊見城",81764,"1998-5-21")
	mcached_manipulate.data_put_proc (mc,"t4769","うるま",35492,"1998-10-19")
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
