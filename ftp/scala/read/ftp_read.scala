// --------------------------------------------------------------
/*
	ftp_read.scala
					Jan/27/2015

*/
// --------------------------------------------------------------
object ftp_read
{

// --------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val hostname = "host_dbase"
	val user = "scott"
	val passwd = "tiger"
	val path_file = "city/iwate.json"

	val json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file)

//	println (json_str)

	val keys = Array ("t0361","t0362","t0363",
			"t0364","t0365","t0366",
			"t0367","t0368","t0369")

	val dict_aa = json_manipulate.json_to_dict_proc (keys,json_str)

	println ("*** ppp ***")

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
