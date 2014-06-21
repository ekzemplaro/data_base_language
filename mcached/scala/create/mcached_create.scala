// --------------------------------------------------------------
//	create/mcached_create.scala
//
//					Oct/07/2011
// --------------------------------------------------------------
import com.danga.MemCached.SockIOPool
import com.danga.MemCached.MemCachedClient
 
// --------------------------------------------------------------
object mcached_create
{
 
// --------------------------------------------------------------
def main (args: Array [String])
{
	println ("*** 開始 ***")
 
	val serverlist = Array ("localhost:11211")
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

	mcached_manipulate.data_put_proc (mc,"t1731","金沢",18392,"1998-9-11")
	mcached_manipulate.data_put_proc (mc,"t1732","輪島",12572,"1998-1-21")
	mcached_manipulate.data_put_proc (mc,"t1733","小松",79391,"1998-7-7")
	mcached_manipulate.data_put_proc (mc,"t1734","七尾",71268,"1998-11-15")
	mcached_manipulate.data_put_proc (mc,"t1735","珠洲",32459,"1998-9-14")
	mcached_manipulate.data_put_proc (mc,"t1736","加賀",61584,"1998-7-17")
	mcached_manipulate.data_put_proc (mc,"t1737","羽咋",24576,"1998-1-26")
	mcached_manipulate.data_put_proc (mc,"t1738","かほく",41732,"1998-5-21")
	mcached_manipulate.data_put_proc (mc,"t1739","白山",37954,"1998-10-19")
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
