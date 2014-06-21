// --------------------------------------------------------------
//	read/mcachedb_update.groovy
//
//					Apr/22/2013
// --------------------------------------------------------------
import java.net.Socket
import groovy.json.*

import	mcached_manipulate 
// --------------------------------------------------------------
public class mcachedb_update
{
 
// --------------------------------------------------------------
public static void main(String[] args)
{
	println ("*** 開始 ***")

	def	key = args[0]
	def	population = Integer.parseInt (args[1])
	print ("\tid = " + key)
	println ("\tpopulation = " + population)

	String server = "localhost"
	int servPort = 21201
	print (server + '\t')
	println (servPort)

	def ss = new Socket(server, servPort);

	ss.withStreams
		{ input, output ->
		def rr = new InputStreamReader( input )

		def ff = new mcached_manipulate ()
		def str_json  = ff.socket_read_proc (key,rr,output)
		println ("str_json = " + str_json)

		def slurper = new JsonSlurper()
		def unit_aa = slurper.parseText (str_json)

		def today = new Date ().format ("yyyy-MM-dd")

		unit_aa['population'] = population
		unit_aa['date_mod'] = today

		def json = new JsonBuilder()
	
		json (unit_aa)

		def str_json_new = json.toString ()
		println ("str_json_new = " + str_json_new)

		ff.socket_write_proc (key,str_json_new,rr,output)
		}

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
