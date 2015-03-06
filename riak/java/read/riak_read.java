// --------------------------------------------------------------
//	read/riak_read.java
//
//					Feb/24/2015
// --------------------------------------------------------------
import	java.util.HashMap;
import	java.util.ArrayList;
import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class riak_read
{

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	final String url_base = "http://host_ubuntu1:8098/riak/shimane";
	final String url_in = url_base + "?keys=true";

	String str_json = get_uri.get_uri_proc (url_in);
//	System.out.println (str_json);

/*
try
	{
	HashMap <String, Object> 
	data_aa = (HashMap <String, Object>)JSON.decode (str_json);
//	System.out.println (data_aa.get ("keys"));
	ArrayList keys = (ArrayList) data_aa.get ("keys");

	int nn = keys.size ();

	System.out.println (nn);
	for (int it=0; it< nn; it++)
		{
		String key = (String)keys.get (it);
		System.out.print (key + "\t");
		final String url_city = url_base + "/" + key;
		String str_json_city = get_uri.get_uri_proc (url_city);
		HashMap <String, Object> data_city
		= (HashMap <String, Object>)JSON.decode (str_json_city);
		System.out.print (data_city.get ("name") + "\t" );
		System.out.print (data_city.get ("population") + "\t");
		System.out.println (data_city.get ("date_mod") );
		}
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}
*/

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
