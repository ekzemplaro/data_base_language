// ----------------------------------------------------------------
/*
	mcached_read.scala

					May/29/2012

*/
// ----------------------------------------------------------------
object	mcached_read
{
// ----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")


	val server = "localhost"
	val port = 11211
	print (server + '\t')
	println (port)

	val keys = Array ("t1731","t1732","t1733",
			"t1734","t1735","t1736",
			"t1737","t1738","t1739")
	 
	var dict_aa = mcached_manipulate.mcached_to_dict_proc (server,port,keys)
	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
