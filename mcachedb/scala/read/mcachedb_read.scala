// ----------------------------------------------------------------
/*
	mcachedb_read.scala

					Feb/04/2015

*/
// ----------------------------------------------------------------
object	mcachedb_read
{
// ----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val server = "host_ubuntu1"
	val port = 21201
	print (server + '\t')
	println (port)

	val keys = Array ("t1521","t1522","t1523","t1524","t1525","t1526",
		"t1527","t1528","t1529","t1530","t1531","t1532")

	var dict_aa = mcached_manipulate.mcached_to_dict_proc (server,port,keys)
	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
