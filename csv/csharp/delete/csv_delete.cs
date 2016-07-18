// ----------------------------------------------------------------
/*
	delete/csv_delete.cs

					Jul/16/2016

*/
// ----------------------------------------------------------------
using System;
using	System.Collections.Generic;

// ----------------------------------------------------------------
public static class csv_delete
{
// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	file_txt = args[0];

	string	key_in = args[1];

	Console.WriteLine (key_in);

	Dictionary <string,Object> dict_aa
		= text_manipulate.csv_read_proc (file_txt);

	if (dict_aa.ContainsKey (key_in))
		{
		dict_aa.Remove (key_in);

		text_manipulate.csv_write_proc (file_txt,dict_aa);
		}

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
