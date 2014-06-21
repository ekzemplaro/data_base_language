/* ------------------------------------------------------------------- */
/*
	examples/csharp/json_to_xml/json_to_xml.cs

					Jul/10/2012

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.IO;
using	System.Text;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public static class	json_to_xml
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** start ***");

	string file_in = args[0];
	string xml_out = args[1];

	string str_json = file_io.file_to_str_proc (file_in);

	Console.WriteLine ("*** bbbbb ***");

	DataSet dst_aa = json_to_dataset_proc (str_json);

	Console.WriteLine ("*** fffff ***");

	Console.WriteLine ("dst_aa.Tables.Count = " + dst_aa.Tables.Count);

	for (int it=0; it< dst_aa.Tables.Count; it++)
		{
		Console.WriteLine
			 ("dst_aa.Tables[" + it + "].Columns.Count = "
			 + dst_aa.Tables[it].Columns.Count);
		Console.WriteLine
			 ("dst_aa.Tables[" + it + "].Rows.Count = "
			 + dst_aa.Tables[it].Rows.Count);
		}

	dst_aa.WriteXml (xml_out,XmlWriteMode.IgnoreSchema);

	Console.WriteLine("*** end ***");
}

// ----------------------------------------------------------------
public static DataSet json_to_dataset_proc (string str_json)
{
	DataSet dst = new DataSet ();

	dst = JsonConvert.DeserializeObject <DataSet> (str_json);

	return	dst;
}

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
