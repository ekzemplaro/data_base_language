// ----------------------------------------------------------------
//
//	Text_delete.hx
//
//						Feb/24/2014
// ----------------------------------------------------------------
import haxe.io.Eof;
import sys.io.File;

// ----------------------------------------------------------------
class Text_delete
{
// ----------------------------------------------------------------
static function main()
{
	Sys.println ("*** 開始 ***");
	var fname = Sys.args ()[0];
	var key = Sys.args ()[1];
	Sys.println (fname);
	Sys.println (key);

	var dict_aa = Text_manipulate.text_to_dict_proc (fname);

	if (dict_aa.exists (key))
		{
		Sys.println ("*** key exists ***");
		dict_aa.remove (key);
		}

	Text_manipulate.dict_display_proc (dict_aa);

	Text_manipulate.dict_to_text_proc (fname,dict_aa);

	Sys.println ("*** 終了 ***");
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
