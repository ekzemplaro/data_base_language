// ------------------------------------------------------------------
//	couch_delete.cs
//
//					Mar/03/2016
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Text;
using System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class couch_delete
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	key_in = args[0];

	Console.WriteLine (key_in);

	string url = "http://localhost:5984/nagano";
	string url_target = url + "/" + key_in;

	string user = "";
	string password = "";

	try
		{
	string str_json = get_uri.get_uri_proc (url_target,user,password);

		string revx = rev_get_proc (str_json);

		string url_delete = url_target + @"?rev=" + revx;
		Console.WriteLine (url_delete);
		try
			{
			get_uri.rest_delete_proc (url_delete,user,password);
			}
		catch (System.Net.WebException ee)
			{
			Console.WriteLine ("*** error ***");
			Console.WriteLine (ee);
			}
		}
	catch (System.Net.WebException ee)
		{
		Console.WriteLine ("*** error ***");
		Console.WriteLine (ee);
		}

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
static string rev_get_proc (string str_json)
{
	Dictionary <string,Object> unit_aa
		= JsonConvert.DeserializeObject
			<Dictionary <string,Object>> (str_json);
	String idx = unit_aa["_id"].ToString ();
	String revx = unit_aa["_rev"].ToString ();

	Console.WriteLine (idx);
	Console.WriteLine (revx);

	return	revx;
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
