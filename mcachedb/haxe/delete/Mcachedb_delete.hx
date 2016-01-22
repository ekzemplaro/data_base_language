// --------------------------------------------------------------
//
//	Mcachedb_delete.hx
//
//						Jan/12/2016
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
        ss.connect (new sys.net.Host("host_ubuntu"),21201);

	Mcached_manipulate.mcached_delete_proc (ss,key);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
