// --------------------------------------------------------------
//
//	Redis_create.hx
//
//					Feb/11/2016
//
// --------------------------------------------------------------
import haxe.Json;
// --------------------------------------------------------------
class Redis_create
{
// --------------------------------------------------------------
static function data_prepare_proc () :  Map <String,Map<String,String>>
{
	var dict_aa = new Map ();

	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1851","福井",25371,"1955-3-24");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1852","敦賀",51864,"1955-8-9");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1853","小浜",59436,"1955-9-29");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1854","大野",91852,"1955-2-15");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1855","勝山",67914,"1955-8-3");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1856","鯖江",93416,"1955-9-21");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1857","あわら",21497,"1955-2-12");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1858","越前",28516,"1955-4-8");
	dict_aa = Text_manipulate.dict_append_proc (dict_aa,"t1859","坂井",53249,"1955-12-19");

	return	dict_aa;
}
// --------------------------------------------------------------
static function main()
{
        Sys.println ("*** 開始 ***");

	var dict_aa = data_prepare_proc ();

	var port: Int = 6379;
	var hostname: String = "host_dbase";
	var ss = new sys.net.Socket();
        ss.connect (new sys.net.Host(hostname),port);

	Redis_manipulate.dict_to_redis_proc (ss,dict_aa);

	ss.close ();

        Sys.println ("*** 終了 ***");
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
