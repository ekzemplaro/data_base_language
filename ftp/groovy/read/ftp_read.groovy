// --------------------------------------------------------------
/*
	ftp_read.groovy
					Mar/12/2013

*/
// --------------------------------------------------------------
import groovy.json.*

import	text_manipulate
import	ftp_manipulate
// --------------------------------------------------------------
public class ftp_read
{

// --------------------------------------------------------------
static void main (String[] args) throws Exception
{
	println ("*** 開始 ***")

	String hostname = "host_dbase"
	String user = "scott"
	String passwd = "tiger"
	String path_file = "city/iwate.json"

	def json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file)

//	System.out.println (json_str)

	def slurper = new JsonSlurper()
	def dict_aa = slurper.parseText (json_str)


	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
