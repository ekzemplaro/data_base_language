// --------------------------------------------------------------
//	read/neo4j_read.java
//
//					Oct/11/2011
// --------------------------------------------------------------
import  net.arnx.jsonic.JSON;

import	java.util.HashMap;
// --------------------------------------------------------------
public class neo4j_read
{

// --------------------------------------------------------------
static void row_parser (String key)
{
	final String uri= "http://localhost:7474/db/data/node/" + key + "/properties";

//	System.out.println (uri);

	String json_str = get_uri.get_uri_proc (uri);

//	System.out.println (json_str);

HashMap <String, Object>  map_data = new HashMap <String, Object> ();

	try
	{
	map_data = (HashMap <String, Object>)JSON.decode (json_str);
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}

	System.out.print (map_data.get ("id") + "\t");
	System.out.print (map_data.get ("name") + "\t");
	System.out.print (map_data.get ("population") + "\t");
	System.out.println (map_data.get ("date_mod"));
}

// --------------------------------------------------------------
public static void main (String[] args)
{
	System.out.println ("*** 開始 ***");

	String [] keys ={"2","3","4",
			"5","6","7",
			"8","9","10"};

	for (String key : keys)
		{
		row_parser (key);
		}

//	json_util.json_disp_proc (json_str);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
