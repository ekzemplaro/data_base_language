// -------------------------------------------------------------------
//	redis_delete.vala
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

//	string hostname = "host_dbase";
//	string hostname = "cddn007";
	string hostname = "172.20.248.69";
	var port = 6379;

	redis_delete_proc (hostname,port,key_in);

	stdout.printf ("*** 終了 ***\n");

	return 0;
}

// -------------------------------------------------------------------
