/* ------------------------------------------------------------------- */
/*
	conv/csharp/xml_to_json/xml_to_json.cs

					Jul/14/2010

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.IO;
using	System.Text;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public static class	xml_to_json
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** start ***");

	string file_in = args[0];
	string file_out = args[1];

	string str_xml = file_io.file_to_str_proc (file_in);

	DataSet dst_aa = xml_to_dataset_proc (str_xml);

	Console.WriteLine (dst_aa.Tables.Count);

	string str_json = dst_to_json_proc (dst_aa);

	file_io.file_write_proc (file_out,str_json);

	Console.WriteLine("*** end ***");
}

// ----------------------------------------------------------------
public static DataSet xml_to_dataset_proc (string str_xml)
{
	DataSet dst = new DataSet ();

	StringReader sr = new StringReader (str_xml);

	try
		{
		dst.ReadXml (sr,XmlReadMode.InferSchema);
		Console.WriteLine ("count = " + dst.Tables.Count);
		}
	catch	(Exception exp)
		{
		Console.Error.WriteLine ("*** error *** " + exp);
		Environment.Exit (1);
		}

	return	dst;
}

// ------------------------------------------------------------------
public static string dst_to_json_proc (DataSet dst_in)
{
	StringWriter sw = new StringWriter();
	JsonSerializer serializer = new JsonSerializer();
	serializer.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;

	using (JsonWriter jw = new JsonTextWriter(sw))
		{
		jw.Formatting = Formatting.Indented;
		serializer.Serialize (jw,dst_in);
		}

	string json_out = sw.ToString();

	return	json_out;
}


// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
