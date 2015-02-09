// --------------------------------------------------------------
//	create/mcached_create.scala
//
//					Feb/03/2015
// --------------------------------------------------------------
import	scala.collection.mutable 

// --------------------------------------------------------------
object mcached_create
{
 
// --------------------------------------------------------------
def main (args: Array [String])
{
	println ("*** 開始 ***")

	val dict_aa = data_prepare_proc ()

	val server = "localhost"
	val port = 11211

	mcached_manipulate.dict_to_mcached_proc (server,port,dict_aa) 

	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1731","金沢",69283,"1998-8-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1732","輪島",31659,"1998-5-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1733","小松",19473,"1998-2-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1734","七尾",54362,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1735","珠洲",95381,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1736","加賀",69274,"1998-10-27")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1737","羽咋",31562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1738","かほく",95328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1739","白山",28135,"1998-10-14")


	dict_aa
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
