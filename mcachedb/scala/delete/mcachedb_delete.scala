// ----------------------------------------------------------------
/*
	mcachedb_delete.scala

					Feb/04/2015

*/
// ----------------------------------------------------------------
object	mcachedb_delete
{
// ----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val key_in = args(0)

	println (key_in)

	val server = "host_ubuntu1"
	val port = 21201
	print (server + '\t')
	println (port)

	mcached_manipulate.delete_record_proc (key_in,server,port)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
