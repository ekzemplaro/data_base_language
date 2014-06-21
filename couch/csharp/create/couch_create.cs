// ------------------------------------------------------------------
//	couch_create.cs
//
//					Aug/02/2011
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class couch_create
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string uri_collection  = "http://host_dbase:5984/city";
	string uri_target = uri_collection + "/cities";

	string user = "";
	string password = "";

	couch_manipulate.data_delete_proc (uri_collection,user,password);

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	string str_json = JsonConvert.SerializeObject (dict_aa);

	string res = get_uri.put_uri_string_proc (uri_target,str_json,user,password);

	Console.WriteLine (res);
	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2021","長野",34512,"2009-6-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2022","松本",17954,"2009-5-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2023","上田",26928,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2024","小諸",25197,"2009-12-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2025","岡谷",24976,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2026","塩尻",28945,"2009-1-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2027","茅野",56184,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2028","飯田",54632,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2029","中野",54823,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2030","諏訪",51715,"2009-1-14");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2031","駒ヶ根",59329,"2009-8-9");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2032","佐久",58678,"2009-12-15");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2033","伊那",57231,"2009-12-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2034","千曲",51489,"2009-2-24");

	return	dict_aa;
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
