// --------------------------------------------------------------
/*
	ftp_delete.scala
					Jan/27/2015

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

	val keys = Array ("t0361","t0362","t0363",
			"t0364","t0365","t0366",
			"t0367","t0368","t0369")

	var dict_aa = json_manipulate.json_to_dict_proc (keys,json_str)

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
