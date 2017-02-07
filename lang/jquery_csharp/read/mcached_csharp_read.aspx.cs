// ----------------------------------------------------------------
//	mcached_csharp_read.aspx.cs
//
//
//					Nov/16/2010
//
// ----------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Memcached.ClientLibrary;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class mcached_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	SockIOPool pool = SockIOPool.GetInstance();
	String[] serverlist = { "127.0.0.1:11211" };
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();

	List <String> keys = new List <String> ()
		{"t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"};

	Dictionary <String,Object>  dict_aa
		= mcache_manipulate.mcache_to_dict_proc (mc,keys);

	string json_str = JsonConvert.SerializeObject (dict_aa);

//	string json_str = mcache_manipulate.get_json_proc (mc,1731,1739);

	pool.Shutdown();

	Response.Write (json_str);
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
