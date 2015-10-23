// ----------------------------------------------------------------
/*
	xml_file/c_sharp/read/xml_read.cs

					Sep/27/2011

*/
// ----------------------------------------------------------------
using System;
using System.Collections.Generic;

// ----------------------------------------------------------------
public static class xml_read
{
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	xml_file = args[0];

	string str_xml = file_io.file_to_str_proc (xml_file);

//	Console.WriteLine (str_xml);

	Dictionary <string,Object> dict_aa =xml_manipulate.xml_to_dict_proc (str_xml);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
