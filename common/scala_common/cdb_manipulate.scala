// ----------------------------------------------------------------
/*
	cdb_manipulate.scala

					Jul/08/2015

*/
// ----------------------------------------------------------------
import	java.io.IOException
import	java.util.HashMap
import	java.util.Set
import	java.util.Enumeration

import	com.strangegizmo.cdb.CdbElement
import	com.strangegizmo.cdb.Cdb

import	com.strangegizmo.cdb.CdbMake

import  net.arnx.jsonic.JSON

import org.json4s._
import org.json4s.JsonDSL._
import org.json4s.native.JsonMethods._
// ----------------------------------------------------------------
object cdb_manipulate
{
// ----------------------------------------------------------------
def	cdb_to_dict_proc (file_cdb: String):(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()


	Enumeration ee = Cdb.elements (file_cdb)

	while (ee.hasMoreElements())
		{
//		var element = (CdbElement)ee.nextElement()
/*
		CdbElement element = (CdbElement)ee.nextElement()

		byte[] key = element.getKey()
		byte[] data = element.getData()
		String str_key = new String(key, "UTF-8")
		String str_json  = new String (data)
		HashMap <String,String>  unit_aa = new HashMap <String,String> ()
*/
//		unit_aa = (HashMap <String,String>)JSON.decode (str_json)

		val json = parse (str_json)

//		dict_aa.put (str_key,unit_aa)
		}
	
	return	dict_aa
}

// ----------------------------------------------------------------
def dict_to_cdb_proc (dict_aa: mutable.Map[String,Object], file_cdb: String) = {
	CdbMake maker = new CdbMake()

/*
	Set set_aaa = dict_aa.keySet ()

	maker.start (file_cdb)

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa
		HashMap <String,String> dict_unit = dict_aa.get (key_aa)

		String nnx = dict_unit.get ("name")
		String ppx = String.valueOf (dict_unit.get ("population"))
		int population = Integer.parseInt (ppx)
		String ddx = dict_unit.get ("date_mod")

		String json_str  = json_manipulate.unit_json_gen_proc
				(nnx,population,ddx)

		maker.add (key.getBytes(), json_str.getBytes())
		}

	maker.finish()
*/
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
