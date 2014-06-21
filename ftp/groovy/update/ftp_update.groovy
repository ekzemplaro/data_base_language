// --------------------------------------------------------------
/*
	ftp_update.groovy
					Mar/12/2013

*/
// --------------------------------------------------------------
import	java.util.HashMap

import groovy.json.*

import	text_manipulate
import	ftp_manipulate
// --------------------------------------------------------------
public class ftp_update
{

// --------------------------------------------------------------
static void main (String[] args) throws Exception
{
	println ("*** 開始 ***")

	String	id = args[0]
	int	population = Integer.parseInt (args[1])
	System.out.print ("\tid = " + id)
	System.out.println ("\tpopulation = " + population)

	String hostname = "host_dbase"
	String user = "scott"
	String passwd = "tiger"
	String path_file = "city/iwate.json"

	def json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file)

//	System.out.println (json_str)

	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)

	dict_aa = text_manipulate.dict_update_proc (dict_aa,id,population)

//	text_manipulate.dict_display_proc (dict_aa)

	def json = new JsonBuilder()

	json (dict_aa)

	def json_out = json.toString ()

	ftp_manipulate.ftp_put_proc (hostname,user,passwd,path_file,json_out)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
