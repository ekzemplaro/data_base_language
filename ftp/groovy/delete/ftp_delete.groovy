// --------------------------------------------------------------
/*
	ftp_delete.groovy
					Mar/12/2013

*/
// --------------------------------------------------------------
import	java.util.HashMap

import groovy.json.*

import	text_manipulate
import	ftp_manipulate
// --------------------------------------------------------------
public class ftp_delete
{

// --------------------------------------------------------------
static void main (String[] args) throws Exception
{
	println ("*** 開始 ***")

	String	key_in = args[0]
	println ("\tkey_in = " + key_in)

	String hostname = "host_dbase"
	String user = "scott"
	String passwd = "tiger"
	String path_file = "city/iwate.json"

	def json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file)

	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)

	if (dict_aa.containsKey (key_in))
		{
		dict_aa = text_manipulate.dict_delete_proc (dict_aa,key_in)
		def json = new JsonBuilder()

		json (dict_aa)

		def json_out = json.toString ()

		ftp_manipulate.ftp_put_proc (hostname,user,passwd,path_file,json_out)
		}

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
