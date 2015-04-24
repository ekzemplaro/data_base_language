// --------------------------------------------------------
/*
	xlsx_update.cs

				Apr/21/2015


*/
// --------------------------------------------------------
using	System;
using	System.IO;
using	System.Collections.Generic;
using	System.Linq;
using	System.Text;

using	OfficeOpenXml;
using	OfficeOpenXml.Style;
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

	text_manipulate.dict_display_proc (dict_aa);

	xlsx_manipulate.dict_to_xlsx_proc (dict_aa,file_xlsx);

	Console.WriteLine ("***	終了 ***");
}

// --------------------------------------------------------

// --------------------------------------------------------
}

// --------------------------------------------------------
