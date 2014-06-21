// -------------------------------------------------------------------
//
//	tcbn_manipulate.scala
//
//					Jan/27/2012
// -------------------------------------------------------------------
import	java.io.PrintWriter
import	java.util.List

import	tokyocabinet.BDB

// -------------------------------------------------------------------
object tcbn_manipulate
{
// -------------------------------------------------------------------
def update_proc (bdb:BDB,key:String,population:Int)
{
	val json_str = bdb.get (key)

	println ("*** tcbn_update *** aaa")

	val json_new = redis_manipulate.create_new_json_proc (json_str,population)

	println ("*** tcbn_update *** bbb")

	println (json_new)

	if(!bdb.put(key, json_new))
		{
		val ecode = bdb.ecode()
		println(ecode)
//		println("put error: " + bdb.errmsg(ecode))
		}
}

// -------------------------------------------------------------------
def delete_proc (bdb:BDB,key:String)
{
	bdb.out (key)

	println ("*** tcbn_delete ***")

}

// -------------------------------------------------------------------
def display_proc (bdb:BDB)
{
	val keys = bdb.range ("t0800",true,"t0900",true,100)
	println ("display_proc\tkeys = " + keys.size ())

/*
	println ("keys = " + keys.toString ())

	for (it <- 0 to (keys.size () - 1))
		{
		println ("key = " + keys.get (it))
		}
*/
	for (it <- 0 to (keys.size () - 1))
		{
		val key = keys.get (it)
		val str_key = "" + key
		val str_json = bdb.get(str_key)

		if (str_json != null)
			{
//			println (str_json)
			redis_manipulate.record_parse_proc (str_key,str_json)
			}

		}


/*
	val  jul: java.util.List[Object] = keys
//	for (key <- convertList(keys))
	for (key <- jul)
//	for (key <- keys)
		{
		val str_key = "" + key
		val str_json = bdb.get(str_key)

		if (str_json != null)
			{
//			println (str_json)
			redis_manipulate.record_parse_proc (str_key,str_json)
			}

		}
*/
}

// -------------------------------------------------------------------
def insert_proc
	(bdb:BDB,key:String,name_in:String,population:Int,date_mod:String)
{
	val json_new = json_manipulate.unit_json_gen_proc (name_in,population,date_mod)

	if(!bdb.put(key, json_new))
		{
		val ecode = bdb.ecode()
		println("put error: " + ecode)
		}
}

// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
