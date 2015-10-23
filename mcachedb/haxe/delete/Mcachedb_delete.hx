// --------------------------------------------------------------
//
//	Mcachedb_delete.hx
//
//						Feb/25/2014
//
// --------------------------------------------------------------
class Mcachedb_delete
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var key = Sys.args ()[0];

	Sys.println (key);

	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("localhost"),21201);

	Mcached_manipulate.mcached_delete_proc (ss,key);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
