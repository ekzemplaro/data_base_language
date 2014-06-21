// -------------------------------------------------------------------
//	mcachedb_delete.vala
//
//					Feb/03/2014
//
// -------------------------------------------------------------------
using GLib;

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");

	string key_in = args[1];
	stdout.printf (key_in + "\n");

	string hostname = "localhost";
	var port = 21201;

	mcached_delete_proc (hostname,port,key_in);

	stdout.printf ("*** 終了 ***\n");

	return 0;
}

// -------------------------------------------------------------------
