// ----------------------------------------------------------------
/*
	cdb_manipulate.java

					May/29/2013

*/
// ----------------------------------------------------------------
import	java.io.IOException;
import	java.util.HashMap;
import	java.util.Set;
import	java.util.Enumeration;

import	com.strangegizmo.cdb.CdbElement;
import	com.strangegizmo.cdb.Cdb;

import	com.strangegizmo.cdb.CdbMake;

import  net.arnx.jsonic.JSON;
// ----------------------------------------------------------------
public class cdb_manipulate
{
// ----------------------------------------------------------------
public static HashMap <String, HashMap<String,String>>
	cdb_to_dict_proc (String file_cdb) throws IOException
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	Enumeration ee = Cdb.elements (file_cdb);

	while (ee.hasMoreElements())
		{
		CdbElement element = (CdbElement)ee.nextElement();
		byte[] key = element.getKey();
		byte[] data = element.getData();
		String str_key = new String(key, "UTF-8");
		String str_json  = new String (data);
		HashMap <String,String>  unit_aa = new HashMap <String,String> ();

		unit_aa = (HashMap <String,String>)JSON.decode (str_json);
		dict_aa.put (str_key,unit_aa);
		}
	
	return	dict_aa;
}

// ----------------------------------------------------------------
static void dict_to_cdb_proc
	 (HashMap <String, HashMap <String,String>> dict_aa,String file_cdb)
	throws IOException
{
	CdbMake maker = new CdbMake();

	Set set_aaa = dict_aa.keySet ();

	maker.start (file_cdb);

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		HashMap <String,String> dict_unit = dict_aa.get (key_aa);

		String nnx = dict_unit.get ("name");
		String ppx = String.valueOf (dict_unit.get ("population"));
		int population = Integer.parseInt (ppx);
		String ddx = dict_unit.get ("date_mod");

		String json_str  = json_manipulate.unit_json_gen_proc
				(nnx,population,ddx);
//				(nnx,ppx,ddx);

		maker.add (key.getBytes(), json_str.getBytes());
		}

	maker.finish();
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
