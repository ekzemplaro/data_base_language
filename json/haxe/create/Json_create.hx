// --------------------------------------------------------------
//
//	Json_create.hx
//
//					Feb/24/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Json_create
// --------------------------------------------------------------
{
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var fname_out = Sys.args ()[0];
	Sys.println (fname_out);

	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0921","宇都宮",29851,"1955-2-5");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0922","小山",62714,"1955-8-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0923","佐野",21356,"1955-10-9");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0924","足利",56928,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0925","日光",67825,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0926","下野",93416,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0927","さくら",21497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0928","矢板",28516,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0929","真岡",53149,"1955-12-19");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0930","栃木",18295,"1955-9-7");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0931","大田原",23971,"1955-3-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0932","鹿沼",94538,"1955-6-24");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0933","那須塩原",89351,"1955-8-30");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t0934","那須烏山",26975,"1955-1-18");
	Text_manipulate.dict_display_proc (dict_aa);

	var json_str = Json.stringify (dict_aa);

	var fout = sys.io.File.write (fname_out, false);

	fout.writeString (json_str);

	fout.close();
	
        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
