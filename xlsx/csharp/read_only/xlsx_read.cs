// --------------------------------------------------------
/*
	xlsx_read.cs

			Apr/17/2015


*/
// --------------------------------------------------------
using	System;
using	System.IO;
using	Excel;
// using	System.Data;
// --------------------------------------------------------
class	excel01
{
// --------------------------------------------------------
static	void	Main (string [] args)
{
	Console.WriteLine ("*** 開始 ***");

	String file_xlsx = args[0];

	FileStream stream = File.Open(file_xlsx,FileMode.Open,FileAccess.Read);

	IExcelDataReader excelReader
		= ExcelReaderFactory.CreateOpenXmlReader(stream);

	excelReader.IsFirstRowAsColumnNames = true;

	while (excelReader.Read())
		{
		String str_out = excelReader.GetString(0) + "\t";
		str_out += excelReader.GetString(1) + "\t";
		str_out += excelReader.GetString(2) + "\t";
		str_out += excelReader.GetString(3);

		Console.WriteLine (str_out);
		}

	excelReader.Close();

	Console.WriteLine("*** 終了 ***");
}

// --------------------------------------------------------
}

// --------------------------------------------------------
