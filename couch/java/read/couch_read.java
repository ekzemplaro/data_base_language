// --------------------------------------------------------------
//	read/couch_read.java
//
//					Jun/23/2014
// --------------------------------------------------------------
import	java.util.HashMap;
import java.util.List;
import  net.arnx.jsonic.JSON;

// --------------------------------------------------------------
public class couch_read
{

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	final String url_collection = "http://localhost:5984/nagano";

	String str_json = get_uri.get_uri_proc (url_collection + "/_all_docs");

	HashMap <String, Object> data
		= (HashMap <String, Object>)JSON.decode (str_json);
	System.out.println (data.get ("total_rows").toString ());

	List <HashMap <String,Object>>list_rows
		= (List <HashMap <String,Object>>) data.get ("rows");

	for (HashMap <String, Object> row: list_rows)
		{
		String key = row.get ("key").toString ();
		String url_target = url_collection + "/" + key;
		String str_unit = get_uri.get_uri_proc (url_target);
		unit_json_parser (key,str_unit);
		}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
static void unit_json_parser (String key,String str_json)
{
	HashMap <String,Object>  unit_aa
			= (HashMap <String,Object>)JSON.decode (str_json);
        String name = unit_aa.get ("name").toString ();
	int population = Integer.parseInt (unit_aa.get ("population").toString ());
        String date_mod = unit_aa.get ("date_mod").toString ();

	System.out.print (key + "\t");
	System.out.print (name + "\t");
	System.out.print (population + "\t");
	System.out.print (date_mod + "\n");
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
