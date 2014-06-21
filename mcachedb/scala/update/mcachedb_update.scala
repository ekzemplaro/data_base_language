// --------------------------------------------------------------
//	read/mcachedb_update.scala
//
//					Sep/15/2010
// --------------------------------------------------------------
import scala.io.Source
import scala.util.parsing.json.JSON

import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;

 
// --------------------------------------------------------------
object mcachedb_update
{
 
// --------------------------------------------------------------
def main(args: Array[String])
{
	println ("*** 開始 ***")

	val	id_in = args(0)
	val	population_in = args(1).toInt

	println (id_in + "\t" + population_in)

	val serverlist = Array ("localhost:21201")
	val pool:SockIOPool  = SockIOPool.getInstance()
	pool.setServers(serverlist)
	pool.initialize()

	val mc:MemCachedClient = new MemCachedClient()

	mcached_manipulate.mcached_update_proc (mc,id_in,population_in)

	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------

