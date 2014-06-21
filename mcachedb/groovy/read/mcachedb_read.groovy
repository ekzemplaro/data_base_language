// ----------------------------------------------------------------
/*
	mcachedb_read.groovy

					Apr/22/2013

*/
// ----------------------------------------------------------------
import java.net.Socket
import groovy.json.*
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	String server = "localhost"
	int servPort = 21201
	print (server + '\t')
	println (servPort)

	def keys = ["t1521","t1522","t1523","t1524","t1525",
		"t1526","t1527","t1528","t1529",
		"t1530","t1531","t1532"]

	ss = new Socket(server, servPort);
	ss.withStreams
		{ input, output ->
		def rr = new InputStreamReader( input )
//
		for (key in keys)
			{
			def ff = new mcached_manipulate ()
			ff.socket_get_record_proc (key,rr,output)
			}
		}

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
