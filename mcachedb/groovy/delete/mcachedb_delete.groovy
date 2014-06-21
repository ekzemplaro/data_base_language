// ----------------------------------------------------------------
/*
	mcachedb_delete.groovy

					Apr/22/2013

*/
// ----------------------------------------------------------------
import java.net.Socket
// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def key=args[0]
	println (key)

	String server = "localhost"
	int servPort = 21201
	print (server + '\t')
	println (servPort)

	ss = new Socket(server, servPort);
	ss.withStreams
		{ input, output ->
		def rr = new InputStreamReader( input )
//
		def ff = new mcached_manipulate ()
		ff.socket_delete_record_proc (key,rr,output)
		}

	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
