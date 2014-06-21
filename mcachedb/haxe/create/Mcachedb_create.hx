// --------------------------------------------------------------
//
//	Mcachedb_create.hx
//
//					Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Mcachedb_create
{
// --------------------------------------------------------------
static function data_prepare_proc () :  Map <String,Map<String,String>>
{
	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1521","新潟",98251,"1955-9-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1522","長岡",53174,"1955-6-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1523","新発田",59846,"1955-5-19");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1524","上越",23918,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1525","糸魚川",67825,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1526","加茂",93416,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1527","三条",21497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1528","佐渡",28516,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1529","柏崎",53249,"1955-12-19");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1530","村上",47915,"1955-6-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1531","十日町",94587,"1955-8-6");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1532","五泉",12838,"1955-9-21");

	return	dict_aa;
}
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var dict_aa = new Map ();

	dict_aa = data_prepare_proc ();

	Text_manipulate.dict_display_proc (dict_aa);

	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("localhost"),21201);

	Mcached_manipulate.dict_to_mcached_proc (ss,dict_aa);

	ss.close ();

        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
