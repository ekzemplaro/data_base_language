// ----------------------------------------------------------------
/*
	tyrant_read.groovy

					Feb/04/2015

*/
// ----------------------------------------------------------------
import mcached_manipulate
import text_manipulate

// ----------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	final String server = "host_ubuntu1"
	final int port = 1978
	print (server + '\t')
	println (port)

	def keys = ["t4761","t4762","t4763","t4764","t4765",
		"t4766","t4767","t4768","t4769"]

	def dict_aa = mcached_manipulate.mcached_to_dict_proc (server,port,keys)

	text_manipulate.dict_display_proc (dict_aa)
/*
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
*/
	println ("*** 終了 ***")
}

// ----------------------------------------------------------------
