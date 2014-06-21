// --------------------------------------------------------------
/*
	ftp_delete.scala
					Mar/12/2013

*/
// --------------------------------------------------------------
import	java.util.HashMap


// --------------------------------------------------------------
object ftp_delete
{

// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val	key_in = args(0)
	println ("\tkey_in = " + key_in)

	val hostname = "host_dbase"
	val user = "scott"
	val passwd = "tiger"
	val path_file = "city/iwate.json"

	var json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file)

//	System.out.println (json_str)

	var dict_aa = json_manipulate.json_to_dict_proc (json_str)

	if (dict_aa.contains (key_in))
		{
		dict_aa = text_manipulate.dict_delete_proc (dict_aa,key_in)

//	text_manipulate.dict_display_proc (dict_aa)

		json_str = json_manipulate.dict_to_json_proc (dict_aa)

		ftp_manipulate.ftp_put_proc (hostname,user,passwd,path_file,json_str)
		}

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
