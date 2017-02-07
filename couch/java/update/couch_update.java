// --------------------------------------------------------------
//	update/couch_update.java
//
//					Jun/23/2014
// --------------------------------------------------------------
import	java.util.HashMap;

import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class couch_update
{

// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	final String url_collection = "http://localhost:5984/nagano";

	String url_target = url_collection + "/" + key;

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

	unit_aa.put ("population",population);

	String today = text_manipulate.get_current_date_proc ();
	unit_aa.put ("date_mod",today);

	String str_json_new = JSON.encode (unit_aa);
	System.out.println (str_json_new);

	get_uri.rest_put_proc (url_target,str_json_new,"text/json");
		}

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
