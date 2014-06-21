// --------------------------------------------------------------
//	groovy_common/mcached_manipulate.groovy
//
//					Jan/06/2014
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
static void socket_get_record_proc (key,rr,output)
{
	def command = "get " + key + '\r\n'
	output << command
	output.flush ()
	def line = ""

	while (null != ( line = rr.readLine() ) && line != "END"  )
		{
		if (line.contains ("VALUE"))
			{
			}
		else if (line.contains ("name"))
			{
			def slurper = new JsonSlurper()
			def unit_aa = slurper.parseText (line)
			print (key + "\t")
			print (unit_aa.name + "\t")
			print (unit_aa.population + "\t")
			println (unit_aa.date_mod)
			}

		}
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
}
// --------------------------------------------------------------
