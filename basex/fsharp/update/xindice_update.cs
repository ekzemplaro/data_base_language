// ------------------------------------------------------------------
//	xindice_update.cs
//
//					Sep/18/2011
//
// ------------------------------------------------------------------
using System;
using System.Collections.Generic;

// ------------------------------------------------------------------
public class exist_update
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	id_in = args[0];
	int	population_in = int.Parse (args[1]);

	Console.WriteLine (id_in + "\t" + population_in);

	string url = @"http://host_xindice:8888/xindice/db/cities/cities";

	string user="";
	string password="";

	Console.WriteLine (url);

	string str_xml = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);

	dict_aa = text_manipulate.dict_update_proc
				(dict_aa,id_in,population_in);

	text_manipulate.dict_display_proc (dict_aa);

	string xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	get_uri.put_uri_string_proc (url,xml_str,user,password);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
