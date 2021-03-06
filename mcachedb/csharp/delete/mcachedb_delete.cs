// -------------------------------------------------------------
//
//	mcachedb_delete.cs
//
//						Feb/02/2015
// -------------------------------------------------------------
using System;

using Memcached.ClientLibrary;


// -------------------------------------------------------------
class mcached_update
{

// -------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	String	key = args[0];

	Console.WriteLine (key);

//	String[] serverlist = { "127.0.0.1:21201" };
	String[] serverlist = { "172.17.0.2:21201" };

	SockIOPool pool = SockIOPool.GetInstance();
	pool.SetServers(serverlist);
	pool.Initialize();

	MemcachedClient mc = new MemcachedClient();


	if (mc.KeyExists(key))
		{
		mc.Delete (key);
		}

	pool.Shutdown();

	Console.WriteLine ("*** 終了 ***");
}
// -------------------------------------------------------------
}
// -------------------------------------------------------------
