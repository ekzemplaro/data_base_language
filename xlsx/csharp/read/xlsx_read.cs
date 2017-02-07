// --------------------------------------------------------
/*
	xlsx_read.cs

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
	Console.WriteLine (file_xlsx);

	Dictionary <string,Object> dict_aa
		= xlsx_manipulate.xlsx_to_dict_proc (file_xlsx);

	text_manipulate.dict_display_proc (dict_aa);

	Console.WriteLine ("***	終了 ***");
}

// --------------------------------------------------------

// --------------------------------------------------------
}

// --------------------------------------------------------
