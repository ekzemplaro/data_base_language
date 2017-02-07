// --------------------------------------------------------------
//	read/neo4j_read.cs
//
//					Oct/21/2011
// --------------------------------------------------------------
using	System;

// --------------------------------------------------------------
public class neo4j_read
{

// --------------------------------------------------------------
static void row_parser (String key)
{
	String uri= "http://localhost:7474/db/data/node/" + key + "/properties";

	string user = "";
	string passwd = "";

	String json_str = get_uri.get_uri_proc (uri,user,passwd);

	if (json_str != null)
		{
		neo4j_manipulate.out_record_proc (key,json_str);
		}
}

// --------------------------------------------------------------
public static void Main (String[] args)
{
	Console.WriteLine ("*** 開始 ***");

	String [] keys ={"2","2","4",
			"5","6","7",
			"8","9","10"};

	foreach (String key in keys)
		{
		row_parser (key);
		}

	Console.WriteLine ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
