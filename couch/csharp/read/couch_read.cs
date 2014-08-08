// ------------------------------------------------------------------
//	read/couch_read.cs
//
//					Jul/24/2014
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Collections.Generic;

using Newtonsoft.Json;

// ------------------------------------------------------------------
public class couch_read
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string url = "http://localhost:5984/nagano";

	string user = "";
	string password = "";

	string url_all_docs = url + "/_all_docs";

	string str_json = get_uri.get_uri_proc (url_all_docs,user,password);

	Dictionary<String,Object> all_docs
		= JsonConvert.DeserializeObject <Dictionary<String,Object>> (str_json);

	String bbb_json = all_docs["rows"].ToString ();
	List <Dictionary<String,Object>> bbb_pp
	= JsonConvert.DeserializeObject <List <Dictionary<String,Object>>>
		 (bbb_json);

	for (int it=0; it< bbb_pp.Count; it++)
		{
		string key = bbb_pp[it]["key"].ToString ();
		string url_target = url + "/" + key;
		string str_unit = get_uri.get_uri_proc
				(url_target,user,password);
		kvalue_manipulate.out_record_proc (key,str_unit);
		}

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
