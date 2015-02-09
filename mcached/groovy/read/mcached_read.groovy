// ----------------------------------------------------------------
/*
	mcached_read.groovy

					Feb/04/2015

*/
// ----------------------------------------------------------------
import mcached_manipulate
import text_manipulate

// ----------------------------------------------------------------
class mcached_read
{
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	final String server = "localhost"
	final int port = 11211
	print (server + '\t')
	println (port)

	def keys = ["t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"]

	def dict_aa = mcached_manipulate.mcached_to_dict_proc (server,port,keys)

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
