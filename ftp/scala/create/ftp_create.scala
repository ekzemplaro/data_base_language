// --------------------------------------------------------------
/*
	ftp_create.scala
					Mar/12/2013

*/
// --------------------------------------------------------------
import scala.collection.mutable
// --------------------------------------------------------------
object ftp_create
{
// --------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val dict_aa = data_prepare_proc ()

	val json_str = json_manipulate.dict_to_json_proc (dict_aa)

// println (json_str)

	def hostname = "host_dbase"
	def user = "scott"
	def passwd = "tiger"
	def file_path = "city/iwate.json"

	ftp_manipulate.ftp_put_proc (hostname,user,passwd,file_path,json_str)

	println ("*** 終了 ***")
}


// --------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {
	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0361","盛岡",27638,"1998-2-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0362","久慈",74292,"1998-4-23")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0363","二戸",96853,"1998-5-24")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0364","宮古",89524,"1998-9-14")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0365","遠野",72931,"1998-8-12")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0366","八幡平",28529,"1998-7-28")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0367","大船渡",39457,"1998-6-19")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0368","一関",47362,"1998-11-15")

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0369","花巻",56872,"1998-10-24")

	dict_aa
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
