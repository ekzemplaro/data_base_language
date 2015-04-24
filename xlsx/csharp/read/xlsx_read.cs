// --------------------------------------------------------
/*
	xlsx_read.cs

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
