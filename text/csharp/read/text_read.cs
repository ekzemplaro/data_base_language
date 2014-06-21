// ----------------------------------------------------------------
/*
	read/text_read.cs

					Jun/13/2014

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
	Console.WriteLine ("*** 開始 ***");

	if (args.Length < 1)
		{
		Console.WriteLine ("*** error ***");
		return 1;
		}

	string	file_in = args[0];

	Console.WriteLine ("file_in = " + file_in);

	Dictionary <string,Object> dict_aa
		= text_manipulate.text_read_proc (file_in);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("*** 終了 ***");

	return	0;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
