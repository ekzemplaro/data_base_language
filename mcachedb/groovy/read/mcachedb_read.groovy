// ----------------------------------------------------------------
/*
	mcachedb_read.groovy

					Feb/04/2015

*/
// ----------------------------------------------------------------
import	text_manipulate
import	mcached_manipulate
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	final String server = "host_ubuntu1"
	final int port = 21201
	print (server + '\t')
	println (port)

	def keys = ["t1521","t1522","t1523","t1524","t1525",
		"t1526","t1527","t1528","t1529",
		"t1530","t1531","t1532"]

	def dict_aa = mcached_manipulate.mcached_to_dict_proc (server,port,keys)

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
