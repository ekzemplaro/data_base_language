// --------------------------------------------------------------
//
//	Tyrant_delete.hx
//
//					Jan/13/2016
//
// --------------------------------------------------------------
class Tyrant_delete
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var key = Sys.args ()[0];

	Sys.println (key);

	var port:Int = 1978;

	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("host_ubuntu"),port);

	Mcached_manipulate.mcached_delete_proc (ss,key);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
