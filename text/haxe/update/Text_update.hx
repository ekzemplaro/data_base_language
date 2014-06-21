// ----------------------------------------------------------------
//
//	Text_update.hx
//
//						Feb/25/2014
// ----------------------------------------------------------------
class Text_update
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

	var dict_aa = Text_manipulate.text_to_dict_proc (fname);

	if (dict_aa.exists (key))
		{
		neko.Lib.println ("*** key exists ***");
		var today = Date.now().toString ();
		var unit_aa = dict_aa.get (key);
		unit_aa.set ("population",Std.string (population));
		unit_aa.set ("date_mod",today);
		}

	Text_manipulate.dict_display_proc (dict_aa);

	Text_manipulate.dict_to_text_proc (fname,dict_aa);

	Sys.println ("*** 終了 ***");
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
