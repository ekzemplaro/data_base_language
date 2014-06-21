// --------------------------------------------------------------
/*
	couch_manipulate.java

				Dec/23/2010

*/
// --------------------------------------------------------------
import java.util.HashMap;
import java.util.List;

import  net.arnx.jsonic.JSON;

// --------------------------------------------------------------
public class couch_manipulate {
// --------------------------------------------------------------
static void data_delete_proc (String uri_collection,String id_in)
{
	String uri_list = uri_collection + "/_all_docs";

	String json_list = get_uri.get_uri_proc (uri_list);
//	System.out.println(json_list);

	HashMap <String, Object>  map_list = new HashMap <String, Object> ();
	map_list = (HashMap <String, Object>)JSON.decode (json_list);
//	System.out.println(map_list.get ("total_rows").toString ());

	List <HashMap <String,Object>>list_rows
		= (List <HashMap <String,Object>>) map_list.get ("rows");

	for (HashMap <String, Object> row: list_rows)
		{
		String id = row.get ("id").toString ();
		if (id.equals (id_in))
			{
		String value = row.get ("value").toString ();

		HashMap <String, Object>value_hash
			 = (HashMap <String, Object>) row.get ("value");
		String rev = value_hash.get ("rev").toString ();

//		System.out.println (id + "\t" + rev);

	String uri_delete = uri_collection + "/" + id_in + "?rev=" + rev;

	try
	{
			get_uri.rest_delete_proc (uri_delete);
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}
			}
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
