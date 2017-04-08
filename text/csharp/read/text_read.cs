// ----------------------------------------------------------------
/*
	read/text_read.cs

					Apr/08/2017

*/
// ----------------------------------------------------------------
using System;
using System.Collections.Generic;

// ----------------------------------------------------------------
public static class text_read
{

// ----------------------------------------------------------------
public static int Main (string[] args)
{
	Console.Error.WriteLine ("*** 開始 ***");

	if (args.Length < 1)
		{
		Console.WriteLine ("*** error ***");
		Console.Error.WriteLine ("Type: text_read.exe cities.txt");
		return 1;
		}

	string	file_in = args[0];

	Console.WriteLine ("file_in = " + file_in);

	Dictionary <string,Object> dict_aa
		= text_manipulate.text_read_proc (file_in);

	text_manipulate.dict_display_proc (dict_aa);

	Console.Error.WriteLine ("*** 終了 ***");

	return	0;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
