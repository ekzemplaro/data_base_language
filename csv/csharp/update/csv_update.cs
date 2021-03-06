// ----------------------------------------------------------------
/*
	update/csv_update.cs

					Jul/17/2016

*/
// ----------------------------------------------------------------
using System;
using System.Collections.Generic;

// ----------------------------------------------------------------
public static class csv_update
{
// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** 開始 ***");

	string	file_txt = args[0];

	string	id_in = args[1];
	int	population_in = int.Parse (args[2]);

	Console.WriteLine (id_in + "\t" + population_in);

	Dictionary <string,Object> dict_aa
		= text_manipulate.csv_read_proc (file_txt);

	dict_aa = text_manipulate.dict_update_proc
		(dict_aa,id_in,population_in);

	text_manipulate.csv_write_proc (file_txt,dict_aa);

	Console.WriteLine ("*** 終了 ***");
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
