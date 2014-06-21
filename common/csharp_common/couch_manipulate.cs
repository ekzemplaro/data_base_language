// ------------------------------------------------------------------
//	couch_manipulate.cs
//
//					Oct/28/2010
//
// ------------------------------------------------------------------
using System;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;

using Newtonsoft.Json;
// ------------------------------------------------------------------
public class couch_manipulate
{
// ------------------------------------------------------------------
public static String rev_get_proc (string uri_collection,string id_in)
{
	string rev = "";
	string uri_list = uri_collection + "/_all_docs";

	string user = "";
	string password = "";
	string json_list = get_uri.get_uri_proc (uri_list,user,password);

	Dictionary<String,Object> status_pp
		= JsonConvert.DeserializeObject <Dictionary<String,Object>> (json_list);

//	Console.WriteLine (status_pp["total_rows"]);

	String bbb_json = status_pp["rows"].ToString ();
	List <Dictionary<String,Object>> bbb_pp
	= JsonConvert.DeserializeObject <List <Dictionary<String,Object>>>
		 (bbb_json);

//	Console.WriteLine (bbb_pp.Count);

	for (int it=0; it< bbb_pp.Count; it++)
		{
		if (bbb_pp[it]["id"].Equals (id_in))
		{ 
		String value_json = bbb_pp[it]["value"].ToString ();
		Dictionary<String,String> value_pp
		= JsonConvert.DeserializeObject <Dictionary<String,String>>
			 (value_json);
		rev = value_pp["rev"];
//		Console.WriteLine (value_pp["rev"]);
		}
		}

	return	rev;
}

// ------------------------------------------------------------------
public static void data_delete_proc (string uri_collection,string user,string password)
{
	string id_in = "cities";

	string rev = couch_manipulate.rev_get_proc (uri_collection,id_in);

	Console.WriteLine ("rev = " + rev);

	if (0 < rev.Length)
		{
	string uri_delete = uri_collection + "/cities?rev=" + rev;

	Console.WriteLine (uri_delete);

	get_uri.rest_delete_proc (uri_delete,user,password);
		}
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
