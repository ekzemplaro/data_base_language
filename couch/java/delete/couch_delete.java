// --------------------------------------------------------------
//	delete/couch_delete.java
//
//					Jun/23/2014
// --------------------------------------------------------------
import	java.util.HashMap;

import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class couch_delete
{

// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];

	System.out.println ("\tkey_in = " + key_in);

	final String url_collection = "http://localhost:5984/nagano";

	String url_target = url_collection + "/" + key_in;

	String str_json = get_uri.get_uri_proc (url_target);

	HashMap <String, Object> unit_aa
			= (HashMap <String,Object>)JSON.decode (str_json);

	if (unit_aa.containsKey ("error"))
		{
		System.out.println ("*** not exist ***");
		}
	else
		{

	String name = unit_aa.get ("name").toString ();
	System.out.println (name);
	String rev = unit_aa.get ("_rev").toString ();
	System.out.println (rev);

	String url_del = url_target + "?rev=" + rev;

	get_uri.rest_delete_proc (url_del);
	}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
