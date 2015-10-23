// ----------------------------------------------------------------
//
//	Csv_update.hx
//
//						Feb/24/2014
// ----------------------------------------------------------------
import haxe.io.Eof;

// ----------------------------------------------------------------
class Csv_update
{
// ----------------------------------------------------------------
static function main()
{
	Sys.println ("*** 開始 ***");
	var fname = Sys.args ()[0];
	var key = Sys.args ()[1];
	var population = Std.parseInt (Sys.args ()[2]);
	Sys.println (fname);
	Sys.println (key);
	Sys.println (population);

	var dict_aa = Text_manipulate.csv_to_dict_proc (fname);

	if (dict_aa.exists (key))
		{
		Sys.println ("*** key exists ***");
		var today = Date.now().toString ();
		var unit_aa = dict_aa.get (key);
		unit_aa.set ("population",Std.string (population));
		unit_aa.set ("date_mod",today);
		}

	Text_manipulate.dict_display_proc (dict_aa);

	Text_manipulate.dict_to_csv_proc (fname,dict_aa);

	Sys.println ("*** 終了 ***");
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
