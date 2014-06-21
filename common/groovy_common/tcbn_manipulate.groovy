// -------------------------------------------------------------------
//
//	tcbn_manipulate.groovy
//
//					Jan/06/2014
// -------------------------------------------------------------------
import	java.io.PrintWriter
import	java.util.List

import	tokyocabinet.BDB
import	groovy.json.*
// -------------------------------------------------------------------
class tcbn_manipulate
{
// -------------------------------------------------------------------
static void update_proc (bdb,key,population_in)
{
	def json_str = bdb.get (key)

	def today = new Date ().format ("yyyy-MM-dd")

	def slurper = new JsonSlurper()
	def unit_aa = slurper.parseText (json_str)


	unit_aa.each { k,v -> print "$k => $v\t" }
	println ()
	unit_aa["population"] = population_in
	unit_aa["date_mod"] = today
	unit_aa.each { k,v -> print "$k => $v\t" }
	println ()

	def json = new JsonBuilder()
	json (unit_aa)
	def json_new = json.toString ()

	if(!bdb.put(key, json_new))
		{
		def ecode = bdb.ecode()
		System.err.println("put error: " + bdb.errmsg(ecode))
		}

}

// -------------------------------------------------------------------
static void delete_proc (bdb,key)
{
	bdb.out (key)
}

// -------------------------------------------------------------------
static tcbn_to_dict_proc (bdb)
{
	def dict_aa = new HashMap()

	List keys = bdb.range ("t0800",true,"t0900",true,100)
//	System.out.println ("keys = " + keys.size ())
	for (Object key  : keys)
		{
//		System.out.println ("key = " + key)
		String str_json = bdb.get((String)key)
		if (str_json != null)
			{
//			println (str_json)
			def slurper = new JsonSlurper()
			def unit_aa = slurper.parseText (str_json)

			dict_aa[key as String] = unit_aa
			}
		}

	return	dict_aa
}
// -------------------------------------------------------------------
static void insert_proc (bdb,key,name_in,population_in,date_mod_in)
{
	def json_new = "{\"name\":\"" + name_in + "\","
	json_new +=  "\"population\":" + population_in + ","
	json_new += "\"date_mod\":\"" + date_mod_in + "\"}"


	if(!bdb.put(key, json_new))
		{
		def ecode = bdb.ecode()
		System.err.println("put error: " + bdb.errmsg(ecode))
		}
}
// -------------------------------------------------------------------
}
// -------------------------------------------------------------------
