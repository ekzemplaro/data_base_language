// --------------------------------------------------------------
//
//	Tyrant_create.hx
//
//					Feb/25/2014
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Tyrant_create
{
// --------------------------------------------------------------
static function data_prepare_proc () :  Map <String,Map<String,String>>
{
	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4761","那覇",25137,"1955-7-24");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4762","宜野湾",59214,"1955-9-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4763","石垣",96518,"1955-6-19");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4764","浦添",23918,"1955-7-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4765","名護",67825,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4766","糸満",93416,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4767","沖縄",21497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4768","豊見城",28516,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t4769","うるま",53249,"1955-12-19");

	return	dict_aa;
}
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var dict_aa = new Map ();

	dict_aa = data_prepare_proc ();

	Text_manipulate.dict_display_proc (dict_aa);

	var port:Int = 1978;
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host("localhost"),port);

	Mcached_manipulate.dict_to_mcached_proc (ss,dict_aa);

	ss.close ();

        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
