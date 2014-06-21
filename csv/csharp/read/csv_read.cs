// ----------------------------------------------------------------
/*
	read/csv_read.cs

					Aug/02/2011

*/
// ----------------------------------------------------------------
using System;
using System.Collections.Generic;

// ----------------------------------------------------------------
public static class csv_read
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	file_in = args[0];

	Console.WriteLine ("file_in = " + file_in);

	Dictionary <string,Object> dict_aa
		= text_manipulate.csv_read_proc (file_in);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
