// -------------------------------------------------------------------
//	tyrant_read.vala
//
//					Feb/04/2014
//
// -------------------------------------------------------------------
using GLib;
using Json;

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");

	string hostname = "localhost";
	var port = 1978;

	string[] keys = {"t4761","t4762","t4763","t4764","t4765","t4766","t4767","t4768","t4769"};

	mcached_read_proc (hostname,port,keys);

	
	stdout.printf ("*** 終了 ***\n");
	return 0;
}

// -------------------------------------------------------------------
