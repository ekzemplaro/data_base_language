// ------------------------------------------------------------------
//	couch_create.cs
//
//					Jul/24/2014
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

	string url_collection  = "http://localhost:5984/nagano";

	string user = "";
	string password = "";

	Console.WriteLine (url_collection);

	try
		{
		get_uri.rest_delete_proc (url_collection,user,password);
		}
	catch (System.Net.WebException ee)
		{
		Console.WriteLine ("*** error *** rest_delete_proc ***");
		Console.WriteLine (ee);
		}

	try
		{
		get_uri.put_uri_string_proc (url_collection,"",user,password);
		}
	catch (System.Net.WebException ee)
		{
		Console.WriteLine ("*** error *** put_uri_string_proc ***");
		Console.WriteLine (ee);
		}

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Dictionary <string,string> unit_aa
				= (Dictionary <string,string>)kv.Value;

		string str_json = JsonConvert.SerializeObject (unit_aa);

		string url_target = url_collection + "/" + kv.Key;
		get_uri.put_uri_string_proc (url_target,str_json,user,password);
		}
	
	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2021","長野",34512,"2009-6-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2022","松本",17954,"2009-5-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2023","上田",76928,"2009-3-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2024","小諸",25197,"2009-12-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2025","岡谷",14976,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2026","塩尻",38945,"2009-1-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2027","茅野",96184,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2028","飯田",51632,"2009-3-7");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2029","中野",64823,"2009-2-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2030","諏訪",52715,"2009-1-14");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2031","駒ヶ根",84329,"2009-8-9");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2032","佐久",28618,"2009-12-15");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2033","伊那",87231,"2009-12-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t2034","千曲",71489,"2009-2-24");

	return	dict_aa;
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
