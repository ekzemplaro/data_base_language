// ----------------------------------------------------------------
/*
	tyrant_read.groovy

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
	int servPort = 1978
	print (server + '\t')
	println (servPort)

	def keys = ["t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"]

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
