// --------------------------------------------------------------
//	update/mcached_update.scala
//
//					Feb/03/2015
// --------------------------------------------------------------
object mcached_update
{
 
// --------------------------------------------------------------
def main(args: Array[String])
{
	println ("*** 開始 ***")

	val	key_in = args(0)
	val	population_in = args(1).toInt

	println (key_in + "\t" + population_in)

	val server = "localhost"
	val port = 11211
	print (server + '\t')
	println (port)

	mcached_manipulate.mcached_update_proc (server,port,key_in,population_in)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}

// --------------------------------------------------------------

