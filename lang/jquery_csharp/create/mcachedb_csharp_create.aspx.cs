// ----------------------------------------------------------------
//	mcachedb_csharp_read.aspx.cs
//
//
//					Oct/27/2010
//
// ----------------------------------------------------------------
using System;
using System.Collections;
using System.Collections.Generic;

using Memcached.ClientLibrary;

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


	string json_str = mcache_manipulate.get_json_proc (mc,1521,1532);
//	string json_str = mcache_manipulate.get_json_proc (mc,1521,1525);

	pool.Shutdown();


	Response.Write (json_str);
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
