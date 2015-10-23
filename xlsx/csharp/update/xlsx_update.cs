// --------------------------------------------------------
/*
	xlsx_update.cs

				Aug/19/2015


*/
// --------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;
using	System.Text;
// --------------------------------------------------------
class	xlsx_read
{
// --------------------------------------------------------
static void Main (string [] args)
{
	Console.WriteLine ("***	開始 ***");

	string	file_xlsx = args[0];
	string	key_in = args[1];
	int	population_in = int.Parse (args[2]);

	Console.WriteLine (file_xlsx);
	Console.WriteLine (key_in + "\t" + population_in);

	Dictionary <string,Object> dict_aa
		= xlsx_manipulate.xlsx_to_dict_proc (file_xlsx);

	dict_aa = text_manipulate.dict_update_proc
		(dict_aa,key_in,population_in);

	xlsx_manipulate.dict_to_xlsx_proc (dict_aa,file_xlsx);

	Console.WriteLine ("***	終了 ***");
}

// --------------------------------------------------------

// --------------------------------------------------------
}

// --------------------------------------------------------
