// -------------------------------------------------------------------
//	tyrant_update.vala
//
//					Feb/05/2014
//
// -------------------------------------------------------------------
using GLib;
using Json;

// -------------------------------------------------------------------
static int main (string[] args)
{
	stdout.printf ("*** 開始 ***\n");

	var key_in = args[1];
	int population_in = int.parse(args[2]);

	stdout.printf (key_in + "\n");
	stdout.printf (population_in.to_string () + "\n");

	string hostname = "localhost";
	var port = 1978;

	mcached_update_proc (hostname,port,key_in,population_in);
	
	stdout.printf ("*** 終了 ***\n");
	return 0;
}

// -------------------------------------------------------------------
