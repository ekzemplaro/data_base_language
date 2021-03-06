// --------------------------------------------------------------
/*
	couch_manipulate.java

					May/06/2015

*/
// --------------------------------------------------------------
import java.util.HashMap;
import java.util.List;

import  net.arnx.jsonic.JSON;

// --------------------------------------------------------------
public class couch_manipulate {
// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>> couch_to_dict_proc
	(String url_collection)
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	String url_all_docs = url_collection + "/_all_docs?include_docs=true";

	String str_json = get_uri.get_uri_proc (url_all_docs);

	HashMap <String, Object> data
		= (HashMap <String, Object>)JSON.decode (str_json);

	List <HashMap <String,String>>list_rows
		= (List <HashMap <String,String>>) data.get ("rows");

	for (HashMap <String, String> row: list_rows)
		{
		String key = row.get ("key").toString ();
		Object doc = row.get ("doc");
		HashMap <String, String> unit_aa = HashMap.class.cast (doc);

		dict_aa.put (key,unit_aa);
		}

	return	dict_aa;
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
