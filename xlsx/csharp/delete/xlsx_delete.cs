// --------------------------------------------------------
/*
	xlsx_delete.cs

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

	Console.WriteLine (file_xlsx);
	Console.WriteLine (key_in);

	Dictionary <string,Object> dict_aa
		= xlsx_manipulate.xlsx_to_dict_proc (file_xlsx);

	if (dict_aa.ContainsKey (key_in))
		{
		dict_aa.Remove (key_in);

		text_manipulate.dict_display_proc (dict_aa);
		xlsx_manipulate.dict_to_xlsx_proc (dict_aa,file_xlsx);
		}

	Console.WriteLine ("***	終了 ***");
}

// --------------------------------------------------------

// --------------------------------------------------------
}

// --------------------------------------------------------
