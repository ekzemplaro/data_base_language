// ----------------------------------------------------------------
/*
	delete/csv_delete.cs

					Aug/02/2011

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

	string	key = args[1];

	Console.WriteLine (key);

	Dictionary <string,Object> dict_aa
		= text_manipulate.csv_read_proc (file_txt);

	dict_aa.Remove (key);

	text_manipulate.dict_display_proc (dict_aa);

	text_manipulate.csv_write_proc (file_txt,dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
