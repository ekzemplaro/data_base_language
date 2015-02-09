// ----------------------------------------------------------------
/*
	tyrant_read.scala

					Feb/05/2015

*/
// ----------------------------------------------------------------
object	tyrant_read
{
// ----------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val server = "host_ubuntu1"
	val port = 1978
	print (server + '\t')
	println (port)

	val keys = Array ("t4761","t4762","t4763","t4764","t4765","t4766",
		"t4767","t4768","t4769")

	var dict_aa = mcached_manipulate.mcached_to_dict_proc (server,port,keys)
	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
