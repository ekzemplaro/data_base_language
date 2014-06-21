// ----------------------------------------------------------------
/*
	xml_file/c_sharp/read/xml_update.cs

					Sep/18/2011

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
	string	id_in = args[1];
	int	population_in = int.Parse (args[2]);

	Console.WriteLine (id_in + "\t" + population_in);

	string str_xml = file_io.file_to_str_proc (xml_file);

//	Console.WriteLine (str_xml);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);

	dict_aa = text_manipulate.dict_update_proc
				(dict_aa,id_in,population_in);

	text_manipulate.dict_display_proc (dict_aa);

	string xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	file_io.file_write_proc (xml_file,xml_str);

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
