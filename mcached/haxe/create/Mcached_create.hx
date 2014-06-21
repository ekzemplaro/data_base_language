// --------------------------------------------------------------
//
//	Mcached_create.hx
//
//					Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Mcached_create
{
// --------------------------------------------------------------
static function data_prepare_proc () :  Map <String,Map<String,String>>
{
	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1731","金沢",98251,"1955-9-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1732","輪島",73514,"1955-6-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1733","小松",35946,"1955-5-19");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1734","七尾",23918,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1735","珠洲",67825,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1736","加賀",93416,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1737","羽咋",21497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1738","かほく",28516,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1739","白山",53249,"1955-12-19");

	return	dict_aa;
}
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var dict_aa = new Map ();

	dict_aa = data_prepare_proc ();

	Text_manipulate.dict_display_proc (dict_aa);

	var port:Int = 11211;
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("localhost"),port);

	Mcached_manipulate.dict_to_mcached_proc (ss,dict_aa);

	ss.close ();

        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
