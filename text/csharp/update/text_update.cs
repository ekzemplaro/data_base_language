// ----------------------------------------------------------------
/*
	update/text_update.cs

					Jul/16/2016

*/
// ----------------------------------------------------------------
using System;
using System.Collections.Generic;

// ----------------------------------------------------------------
public static class text_update
{
// ----------------------------------------------------------------
public static int Main (string[] args)
{
	Console.Error.WriteLine ("*** 開始 ***");

	if (args.Length < 2)
		{
		Console.Error.WriteLine ("*** error ***");
		return 1;
		}

	string	file_txt = args[0];

	string	id_in = args[1];
	int	population_in = int.Parse (args[2]);

	Console.WriteLine (id_in + "\t" + population_in);

	Dictionary <string,Object> dict_aa
		= text_manipulate.text_read_proc (file_txt);

	dict_aa = text_manipulate.dict_update_proc
		(dict_aa,id_in,population_in);

	text_manipulate.text_write_proc (file_txt,dict_aa);

	Console.Error.WriteLine ("*** 終了 ***");

	return	0;
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
