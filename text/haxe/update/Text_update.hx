// ----------------------------------------------------------------
//
//	Text_update.hx
//
//						Feb/11/2016
// ----------------------------------------------------------------
class Text_update
{
// ----------------------------------------------------------------
static function main()
{
	Sys.println ("*** 開始 ***");
	var fname: String = Sys.args ()[0];
	var key: String = Sys.args ()[1];
	var population: Int = Std.parseInt (Sys.args ()[2]);
	Sys.println (fname);
	Sys.println (key);
	Sys.println (population);

	var dict_aa = Text_manipulate.text_to_dict_proc (fname);

	if (dict_aa.exists (key))
		{
		dict_aa = Text_manipulate.dict_update_proc (dict_aa,key,population);
		Sys.println ("*** key exists ***");

		Text_manipulate.dict_to_text_proc (fname,dict_aa);
		}

	Sys.println ("*** 終了 ***");
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
