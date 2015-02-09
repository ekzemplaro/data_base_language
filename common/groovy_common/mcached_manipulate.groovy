// --------------------------------------------------------------
//	groovy_common/mcached_manipulate.groovy
//
//					Feb/04/2015
// --------------------------------------------------------------
import	java.text.DateFormat
import	java.text.SimpleDateFormat

import	groovy.json.*
// --------------------------------------------------------------
class mcached_manipulate
{
 
// --------------------------------------------------------------
static socket_write_proc (key,value_in,rr,output)
{
	def llx = value_in.getBytes().length
	def command = "set " + key + " 0 0 " + llx + '\r\n'

	output << command
	output.flush ()
	def command_bb =  (value_in + '\r\n').getBytes()
	output << command_bb
	output.flush ()

	def line
	while (null != ( line = rr.readLine() ) && line != "STORED"  )
		{
		}
}

// --------------------------------------------------------------
static socket_read_proc (key,rr,output)
{
	def command = "get " + key + '\r\n'
	output << command
	output.flush ()
	def json_str = null

	def rec_0 = rr.readLine()
	println (rec_0)

	if (rec_0.equals ("END"))
		{
		println ("END")
		}
	else
		{
		def rec_1 = rr.readLine()
		println (rec_1)
		def rec_2 = rr.readLine()
		json_str = rec_2
		println (rec_2)
		}

	return json_str
}

// --------------------------------------------------------------
static socket_get_record_proc (key,rr,output)
{
	def command = "get " + key + '\r\n'
	output << command
	output.flush ()
	def line = ""
	def unit_aa = []

	while (null != ( line = rr.readLine() ) && line != "END"  )
		{
		if (line.contains ("VALUE"))
			{
			}
		else if (line.contains ("name"))
			{
			def slurper = new JsonSlurper()
			unit_aa = slurper.parseText (line)
			}
		}

	return	unit_aa
}

// --------------------------------------------------------------
static void socket_delete_record_proc (key,rr,output)
{
	def command = "delete " + key + '\r\n'
	output << command
	output.flush ()
	def out_str = ""
	key = ""
	def line = ""
	while( null != ( line = rr.readLine() ) && line != "END"  )
		{
		out_str += line

		if (line == "NOT_FOUND")
			break
		else if (line == "DELETED")
			break
		}

	println out_str
}

// --------------------------------------------------------------
static mcached_to_dict_proc (server,port,keys)
{
	def dict_aa = new HashMap()

	def ss = new Socket(server, port)

	ss.withStreams
		{ input, output ->
		def rr = new InputStreamReader( input )

		for (key in keys)
			{
			def unit_aa = mcached_manipulate.socket_get_record_proc (key,rr,output)

			dict_aa[key] = unit_aa
			}
		}

	ss.close ()

	return	dict_aa
}

// --------------------------------------------------------------
static void dict_to_mcached_proc (server,port,dict_aa)
{
	def ss = new Socket(server, port);

	ss.withStreams
		{input, output ->
		def rr = new InputStreamReader( input )

	dict_aa.each
		{
		key,value ->
		def json = new JsonBuilder()
		json (value)

		def str_json = json.toString ()

		socket_write_proc (key,str_json,rr,output)
		}
		}

	ss.close ()
}
// --------------------------------------------------------------
static mcached_update_proc (server,port,key,population)
{
	def ss = new Socket(server, port);

	ss.withStreams
		{ input, output ->
		def rr = new InputStreamReader( input )

		def str_json  = socket_read_proc (key,rr,output)
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

		socket_write_proc (key,str_json_new,rr,output)
		}

	ss.close ()
}
// --------------------------------------------------------------
static mcached_delete_proc (server,port,key)
{
	def ss = new Socket(server,port)
	ss.withStreams
		{ input, output ->
		def rr = new InputStreamReader( input )

		socket_delete_record_proc (key,rr,output)
		}

	ss.close ()
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
