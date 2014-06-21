// --------------------------------------------------------------
//	update/riak_update.java
//
//					Mar/12/2013
// --------------------------------------------------------------
import	java.util.HashMap;

import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class riak_update
{

// --------------------------------------------------------------
public static void main (String[] args) throws Exception
{
	System.out.println ("*** 開始 ***");

	String	key_in = args[0];
	int	population = Integer.parseInt (args[1]);
	System.out.print ("\tkey_in = " + key_in);
	System.out.println ("\tpopulation = " + population);

	String url_target = "http://localhost:8098/riak/shimane/" + key_in;

	String str_json = get_uri.get_uri_proc (url_target);


	HashMap <String, Object> data_city
		= (HashMap <String, Object>)JSON.decode (str_json);

	String str_population = Integer.toString (population);

	data_city.put ("population",str_population);
	String today = text_manipulate.get_current_date_proc ();
	data_city.put ("date_mod",today);

	String str_json_out = JSON.encode (data_city);
	get_uri.rest_put_proc (url_target,str_json_out,"text/json");

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
