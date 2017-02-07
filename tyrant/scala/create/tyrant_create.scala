// --------------------------------------------------------------
//	create/tyrant_create.scala
//
//					Feb/05/2015
// --------------------------------------------------------------
import	scala.collection.mutable 
// --------------------------------------------------------------
object tyrant_create
{
 
// --------------------------------------------------------------
def main (args: Array [String])
{
	println ("*** 開始 ***")

	val dict_aa = data_prepare_proc ()

	val server = "host_ubuntu1"
	val port = 1978

	mcached_manipulate.dict_to_mcached_proc (server,port,dict_aa) 
 


	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4761","那覇",61283,"1998-8-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4762","宜野湾",37659,"1998-5-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4763","石垣",29473,"1998-2-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4764","浦添",54162,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4765","名護",97381,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4766","糸満",69274,"1998-10-27")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4767","沖縄",31562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4768","豊見城",95328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t4769","うるま",28135,"1998-10-14")


	dict_aa
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
