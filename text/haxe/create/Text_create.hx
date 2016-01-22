// --------------------------------------------------------------
//
//	Text_create.hx
//
//					Jan/12/2016
//
// --------------------------------------------------------------
class Text_create
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var fname_out = Sys.args ()[0];
	Sys.println (fname_out);

	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2381","名古屋",69851,"1955-2-5");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2382","豊橋",62754,"1955-8-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2383","岡崎",79356,"1955-10-9");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2384","一宮",56928,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2385","蒲郡",61825,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2386","常滑",93486,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2387","大府",58497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2388","瀬戸",28516,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t2389","犬山",53149,"1955-12-19");

	Text_manipulate.dict_to_text_proc (fname_out,dict_aa);

        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
