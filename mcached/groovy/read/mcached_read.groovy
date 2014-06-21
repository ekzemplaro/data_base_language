// ----------------------------------------------------------------
/*
	mcached_read.groovy

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
	int servPort = 11211
	print (server + '\t')
	println (servPort)

	def keys = ["t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"]

	ss = new Socket(server, servPort);
	ss.withStreams
		{ input, output ->
		def rr = new InputStreamReader( input )

		for (key in keys)
			{
			def ff = new mcached_manipulate ()
			ff.socket_get_record_proc (key,rr,output)
			}
		}

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
