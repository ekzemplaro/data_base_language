// --------------------------------------------------------
/*
	xlsx_manipulate.cs

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
public class	xlsx_manipulate
{
// --------------------------------------------------------
public static Dictionary <string,Object> xlsx_to_dict_proc (String file_xlsx)
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	using (var pck = new OfficeOpenXml.ExcelPackage()) 
	{
	try
		{
		using (var stream = File.OpenRead(file_xlsx))
			{
			pck.Load(stream);
			}
		}
		catch (System.IO.IOException ex) 
		{
		if (ex.Message.Contains("because it is being used by another process.")) 
		{
		Console.WriteLine ("Excelファイルを閉じてください。");
		}
                  
//		return;
		}
		catch (Exception)
		{
			throw;
		}

		var ws = pck.Workbook.Worksheets.First();

		Console.WriteLine (ws.Dimension.End.Row);

		for (int row = 1; row <= ws.Dimension.End.Row; row++)
		{
		String key = ws.Cells [row,1].Value.ToString();
		String name = ws.Cells [row,2].Value.ToString();
		int population =  int.Parse (ws.Cells [row,3].Value.ToString());
		String date_mod = ws.Cells [row,4].Value.ToString();

		dict_aa = text_manipulate.dict_append_proc
			(dict_aa,key,name,population,date_mod);
		}

	}

	return	dict_aa;
}

// --------------------------------------------------------
public static void dict_to_xlsx_proc
	(Dictionary <string,Object> dict_aa,String file_xlsx)
{
	if (File.Exists (file_xlsx))
		{
		File.Delete(file_xlsx);
		}

	var newFile = new FileInfo (file_xlsx);

	using (var package = new ExcelPackage(newFile))
		{
		ExcelWorksheet worksheet = package.Workbook.Worksheets.Add ("Sheet1");

		int irow = 1;
		foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Dictionary <string,string> unit_aa
				= (Dictionary <string,string>)kv.Value;
                worksheet.Cells[irow,1].Value = kv.Key;
                worksheet.Cells[irow,2].Value = unit_aa["name"];
                worksheet.Cells[irow,3].Value = int.Parse (unit_aa["population"]);
                worksheet.Cells[irow,4].Value = unit_aa["date_mod"];

		irow++;
		}
                
		package.Save();
		}
}

// --------------------------------------------------------
}
// --------------------------------------------------------
