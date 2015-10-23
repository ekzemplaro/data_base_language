// ----------------------------------------------------------------
/*
	delete/text_delete.cs

					Jun/13/2014

*/
// ----------------------------------------------------------------
using System;
using	System.Collections.Generic;

// ----------------------------------------------------------------
public static class text_delete
{
// ----------------------------------------------------------------
public static int Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	if (args.Length < 2)
		{
		Console.WriteLine ("*** error ***");
		return 1;
		}

	string	file_txt = args[0];

	String	key_in = args[1];

	Console.WriteLine (key_in);

//	Dictionary <string,Dictionary <string,string>> dict_aa
	Dictionary <string,Object> dict_aa
		= text_manipulate.text_read_proc (file_txt);

	if (dict_aa.ContainsKey (key_in))
		{
		dict_aa.Remove (key_in);

		text_manipulate.dict_display_proc (dict_aa);

		text_manipulate.text_write_proc (file_txt,dict_aa);
		}

	Console.WriteLine ("*** 終了 ***");

	return	0;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
