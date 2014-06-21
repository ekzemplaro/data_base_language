// -----------------------------------------------------------------
//	read/couch_read.scala
//
//						Mar/12/2013
//
// -----------------------------------------------------------------
object couch_read {

// -----------------------------------------------------------------
def main( args: Array[String] )
{
	println	("*** 開始 ***")

	val url_in="http://cddn007:5984/city/cities"

	val str_json = file_io.url_to_str_proc (url_in)

//	println (str_json)

	var dict_aa = json_manipulate.json_to_dict_proc (str_json)

	text_manipulate.dict_display_proc (dict_aa)

	println	("*** 終了 ***")
}

// -----------------------------------------------------------------
}

// -----------------------------------------------------------------
