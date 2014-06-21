// ------------------------------------------------------------------
//	webdav_create.cs
//
//					May/21/2012
//
// ------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

using	Newtonsoft.Json;
// ------------------------------------------------------------------
public class webdav_create
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string url_target = "http://host_dbase:3004/city/tokyo.json";

	string user = "";
	string passwd = "";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string str_json = JsonConvert.SerializeObject (dict_aa);

//	Console.WriteLine (str_json);

	get_uri.put_uri_string_proc
			(url_target,str_json,user,passwd);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1351","八王子",34518,"2009-6-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1352","立川",17954,"2009-5-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1353","武蔵野",26928,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1354","三鷹",25197,"2009-12-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1355","青梅",24976,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1356","府中",28945,"2009-1-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1357","昭島",56184,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1358","調布",54632,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1359","町田",23951,"2009-2-12");

	return	dict_aa;
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
