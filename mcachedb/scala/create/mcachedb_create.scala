// --------------------------------------------------------------
//	create/mcachedb_create.scala
//
//					Feb/04/2015
// --------------------------------------------------------------
import	scala.collection.mutable
 
// --------------------------------------------------------------
object mcachedb_create
{
 
// --------------------------------------------------------------
def main (args: Array [String])
{
	println ("*** 開始 ***")

	val dict_aa = data_prepare_proc ()

	val server = "host_ubuntu1"
	val port = 21201

	mcached_manipulate.dict_to_mcached_proc (server,port,dict_aa) 
/* 
//	val serverlist = Array ("localhost:21201")
	val serverlist = Array ("host_ubuntu1:21201")
	val pool: SockIOPool = SockIOPool.getInstance()
	pool.setServers(serverlist)
	pool.initialize()

	mcached_write_proc ()
*/
	println ("*** 終了 ***")
}
 
// --------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1521","新潟",69283,"1998-8-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1522","長岡",31659,"1998-5-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1523","新発田",19473,"1998-2-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1524","上越",54362,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1525","糸魚川",95381,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1526","加茂",69274,"1998-10-27")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1527","三条",31562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1528","佐渡",95328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1529","柏崎",28135,"1998-10-14")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1530","村上",91625,"1998-8-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1531","十日町",63781,"1998-4-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1532","五泉",58426,"1998-9-3")


	dict_aa
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
