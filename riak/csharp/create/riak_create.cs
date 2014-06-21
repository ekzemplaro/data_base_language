// ------------------------------------------------------------------
//	riak_create.cs
//
//					Apr/09/2013
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class riak_create
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	String url_base = "http://localhost:8098/riak/shimane";

	String user = "";
	String password = "";

	Dictionary <string,Object> dict_aa = data_prepare_proc ();

	foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Console.Write (kv.Key + "\n");
		String json_city = JsonConvert.SerializeObject (kv.Value);
		Console.Write (json_city + "\n");
		String uri_target = url_base + "/" + kv.Key;
		String res = get_uri.put_uri_string_proc (uri_target,json_city,user,password);
		Console.WriteLine (res);
		}

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
static Dictionary <string,Object> data_prepare_proc ()
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3251","松江",78512,"2009-6-12");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3252","出雲",17954,"2009-3-19");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3253","大田",76928,"2009-8-28");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3254","雲南",45197,"2009-19-21");

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3255","江津",34276,"2009-11-25");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3256","浜田",28945,"2009-5-26");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3257","益田",96184,"2009-1-21");
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3258","安来",54632,"2009-3-7");

	return	dict_aa;
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
