// -------------------------------------------------------------- 
//
//	cassandra_create.scala
//
//						Sep/05/2013
//
// -------------------------------------------------------------- 
import scala.collection.mutable

import	java.sql.Connection
import	java.sql.DriverManager

// -------------------------------------------------------------- 
object cassandra_create
{
// -------------------------------------------------------------- 
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val dict_aa = data_prepare_proc ()

	val str_connect = "jdbc:cassandra://localhost:9160/city"

	var conn = DriverManager.getConnection (str_connect)

	cassandra_manipulate.dict_to_cassandra_proc (dict_aa,conn)

	conn.close ()

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// -------------------------------------------------------------- 
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0531","秋田",51673,"1998-5-14")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0532","男鹿",73259,"1998-9-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0533","由利本荘",86931,"1998-3-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0534","横手",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0535","鹿角",41795,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0536","大館",69274,"1998-10-27")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0537","能代",31562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0538","にかほ",95328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t0539","湯沢",27135,"1998-10-14")

	dict_aa
}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
