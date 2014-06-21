// ----------------------------------------------------------------
//	mcached_csharp_read.aspx.cs
//
//
//					Sep/21/2010
//
// ----------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Memcached.ClientLibrary;

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


	string json_str = mcache_manipulate.get_json_proc (mc,1731,1739);

	pool.Shutdown();

	Response.Write (json_str);
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
