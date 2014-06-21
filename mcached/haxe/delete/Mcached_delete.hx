// --------------------------------------------------------------
//
//	Mcached_delete.hx
//
//						Feb/25/2014
//
// --------------------------------------------------------------
class Mcached_delete
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main ()
{
	Sys.println ("*** 開始 ***");

	var key = Sys.args ()[0];

	Sys.println (key);

	var port:Int = 11211;
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("localhost"),port);

	Mcached_manipulate.mcached_delete_proc (ss,key);

	ss.close ();

	Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
