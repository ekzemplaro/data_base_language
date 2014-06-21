// ----------------------------------------------------------------
/*
	mcachedb_delete.scala

					May/29/2012

*/
// ----------------------------------------------------------------
object	tyrant_delete
{
// ----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val key_in = args(0)

	println (key_in)

	val server = "localhost"
	val port = 1978
	print (server + '\t')
	println (port)

	mcached_manipulate.delete_record_proc (key_in,server,port)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
