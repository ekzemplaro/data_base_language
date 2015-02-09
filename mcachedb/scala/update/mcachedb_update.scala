// --------------------------------------------------------------
//	read/mcachedb_update.scala
//
//					Feb/04/2015
// --------------------------------------------------------------
object mcachedb_update
{
 
// --------------------------------------------------------------
def main(args: Array[String])
{
	println ("*** 開始 ***")

	val	key_in = args(0)
	val	population_in = args(1).toInt

	println (key_in + "\t" + population_in)

	val server = "host_ubuntu1"
	val port = 21201
	print (server + '\t')
	println (port)

	mcached_manipulate.mcached_update_proc (server,port,key_in,population_in)

	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------

