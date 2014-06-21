// --------------------------------------------------------------
//	create/mcachedb_create.scala
//
//					Jun/11/2013
// --------------------------------------------------------------
import com.danga.MemCached.SockIOPool
import com.danga.MemCached.MemCachedClient
 
// --------------------------------------------------------------
object mcachedb_create
{
 
// --------------------------------------------------------------
def main (args: Array [String])
{
	println ("*** 開始 ***")
 
	val serverlist = Array ("localhost:21201")
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

	mcached_manipulate.data_put_proc (mc,"t1521","新潟",41986,"1998-10-21")
	mcached_manipulate.data_put_proc (mc,"t1522","長岡",36178,"1998-9-2")
	mcached_manipulate.data_put_proc (mc,"t1523","新発田",52894,"1998-7-12")
	mcached_manipulate.data_put_proc (mc,"t1524","上越",71462,"1998-8-15")
	mcached_manipulate.data_put_proc (mc,"t1525","糸魚川",32158,"1998-9-14")
	mcached_manipulate.data_put_proc (mc,"t1526","加茂",21653,"1998-7-17")
	mcached_manipulate.data_put_proc (mc,"t1527","三条",24751,"1998-1-26")
	mcached_manipulate.data_put_proc (mc,"t1528","佐渡",34892,"1998-4-12")
	mcached_manipulate.data_put_proc (mc,"t1529","柏崎",74172,"1998-9-15")
	mcached_manipulate.data_put_proc (mc,"t1530","村上",64582,"1998-6-22")
	mcached_manipulate.data_put_proc (mc,"t1531","十日町",54712,"1998-7-25")
	mcached_manipulate.data_put_proc (mc,"t1532","五泉",41579,"1998-9-14")
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
