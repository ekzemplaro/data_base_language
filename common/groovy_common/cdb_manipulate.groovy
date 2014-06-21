// ----------------------------------------------------------------
/*
	cdb_manipulate.groovy

					May/30/2013

*/
// ----------------------------------------------------------------
import	java.io.IOException
import	java.util.HashMap
import	java.util.Set
import	java.util.Enumeration

import	com.strangegizmo.cdb.CdbElement
import	com.strangegizmo.cdb.Cdb

import	com.strangegizmo.cdb.CdbMake

import groovy.json.*
// ----------------------------------------------------------------
public class cdb_manipulate
{
// ----------------------------------------------------------------
public static HashMap <String, HashMap<String,String>>
	cdb_to_dict_proc (String file_cdb) throws IOException
{
	def dict_aa = new HashMap()
	Enumeration ee = Cdb.elements (file_cdb)

	while (ee.hasMoreElements())
		{
		CdbElement element = (CdbElement)ee.nextElement()
		byte[] key = element.getKey()
		byte[] data = element.getData()
		def str_key = new String(key, "UTF-8")
		def str_json  = new String (data)
//		def unit_aa = new HashMap()

		def slurper = new JsonSlurper()
		def unit_aa = slurper.parseText (str_json)
//		unit_aa = (HashMap <String,String>)JSON.decode (str_json)
		dict_aa.put (str_key,unit_aa)
		}
	
	return	dict_aa
}

// ----------------------------------------------------------------
static void dict_to_cdb_proc (dict_aa,file_cdb)
	throws IOException
{
	CdbMake maker = new CdbMake()

	maker.start (file_cdb)

	dict_aa.each
		{
		key,value ->
			def json = new JsonBuilder()
			json (value)

			def str_json = json.toString ()
			maker.add (key.getBytes(), str_json.getBytes())
		}

	maker.finish()
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
