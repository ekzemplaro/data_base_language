// ------------------------------------------------------------------
//	ftp_read.cs
//
//					Oct/19/2011
//
// ------------------------------------------------------------------
using	System;
using	System.Collections.Generic;

// ------------------------------------------------------------------
public class ftp_read
{
// ------------------------------------------------------------------
static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string url_in = "ftp://host_dbase/city/iwate.json";
	string user = "scott";
	string passwd = "tiger";

	string str_json = ftp_manipulate.ftp_to_str_proc (url_in,user,passwd);

//	Console.WriteLine (str_json);
	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
