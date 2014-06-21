// --------------------------------------------------------------
//
//	Csv_create.hx
//
//					Feb/24/2014
//
// --------------------------------------------------------------
class Csv_create
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var fname_out = Sys.args ()[0];
	neko.Lib.println (fname_out);

	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1271","千葉",12759,"1955-2-5");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1272","勝浦",69784,"1955-8-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1273","市原",28346,"1955-10-9");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1274","流山",56128,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1275","八千代",67425,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1276","我孫子",93756,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1277","鴨川",81457,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1278","銚子",73691,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1279","市川",64927,"1955-12-19");
	Text_manipulate.dict_display_proc (dict_aa);

	Text_manipulate.dict_to_csv_proc (fname_out,dict_aa);

        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
