// ----------------------------------------------------------------
//	mcachedb_csharp_read.aspx.cs
//
//
//					Jul/25/2014
//
// ----------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Memcached.ClientLibrary;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class mcachedb_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	SockIOPool pool = SockIOPool.GetInstance();
	String[] serverlist = { "127.0.0.1:21201" };
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();

	List <String> keys = new List <String> ()
		{"t1521","t1522","t1523","t1524","t1525","t1526",
		"t1527","t1528","t1529","t1530","t1531","t1532"};

	Dictionary <String,Object> dict_aa
		= mcache_manipulate.mcache_to_dict_proc (mc,keys);

	string json_str = JsonConvert.SerializeObject (dict_aa);

//	string json_str = mcache_manipulate.get_json_proc (mc,1521,1532);

	pool.Shutdown();


	Response.Write (json_str);
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
