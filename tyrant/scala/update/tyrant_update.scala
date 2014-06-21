// --------------------------------------------------------------
//	tyrant_update.scala
//
//					Oct/06/2011
// --------------------------------------------------------------
import scala.io.Source
import scala.util.parsing.json.JSON

import com.danga.MemCached.SockIOPool
import com.danga.MemCached.MemCachedClient

import java.net.Socket
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.OutputStream; 
// --------------------------------------------------------------
object tyrant_update
{
 
// --------------------------------------------------------------
def main(args: Array[String])
{
	println ("*** 開始 ***")

	val	key_in = args(0)
	val	population_in = args(1).toInt

	println (key_in + "\t" + population_in)

	val server = "localhost"
	val servPort = 1978
	print (server + '\t')
	println (servPort)

	var ss = new Socket(server, servPort)

	var input = ss.getInputStream ()
	var rr = new InputStreamReader (input)
	var output = ss.getOutputStream ()

	mcached_manipulate.get_record_proc (key_in,rr,output)
/* --- */
/*
	val serverlist = Array ("localhost:1978")
	val pool:SockIOPool  = SockIOPool.getInstance()
	pool.setServers(serverlist)
	pool.initialize()

	val mc:MemCachedClient = new MemCachedClient()

	mcached_manipulate.mcached_update_proc (mc,key_in,population_in)
*/
	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------

