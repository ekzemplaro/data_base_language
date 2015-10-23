// ----------------------------------------------------------------
/*
	mcachedb_delete.groovy

					Feb/04/2015

*/
// ----------------------------------------------------------------
import mcached_manipulate
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def key=args[0]
	println (key)

	final String server = "host_ubuntu1"
	final int port = 21201
	print (server + '\t')
	println (port)

	mcached_manipulate.mcached_delete_proc (server,port,key)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
