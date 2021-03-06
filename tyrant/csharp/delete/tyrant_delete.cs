// -------------------------------------------------------------
//
//	tyrant_delete.cs
//
//						Jun/23/2011
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

	String[] serverlist = { "172.20.208.233:1978" };

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
