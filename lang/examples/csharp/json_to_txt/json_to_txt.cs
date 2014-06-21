/* ------------------------------------------------------------------- */
/*
	examples/csharp/json_to_txt/json_to_txt.cs

					Jul/10/2012

*/
/* ------------------------------------------------------------------- */
using	System;
using	System.Data;
using	System.IO;
using	System.Text;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public static class	json_to_txt
{

// ----------------------------------------------------------------
public static void Main (string[] args)
{
	Console.WriteLine ("*** start ***");

	string file_in = args[0];
	string file_out = args[1];

	string str_json = file_io.file_to_str_proc (file_in);

	str_json = json_convert_proc (str_json);

StreamWriter fp_out = new StreamWriter ("tmp00215.json");
fp_out.WriteLine (str_json);
fp_out.Close ();

//	Console.WriteLine (str_xml);

	DataSet dst_aa = JsonConvert.DeserializeObject <DataSet> (str_json);
//	json_dset dst_aa = JsonConvert.DeserializeObject <json_dset> (str_json);

	Console.WriteLine ("*** bbbb ***");

//	int nn = dst_aa.dss.Tables.Count;
	int nn = dst_aa.Tables.Count;

	Console.WriteLine (nn);

	for (int it=0; it< nn; it++)
		{
		DataTable tbl_cur = dst_aa.Tables[it];
		Console.WriteLine (tbl_cur.TableName);
		int nn_columns = tbl_cur.Columns.Count;
		int nn_rows = tbl_cur.Rows.Count;
		Console.Write ("nn_columns = " + nn_columns);
		Console.WriteLine ("\tnn_rows = " + nn_rows);
		}


//	Console.WriteLine (str_json);

//	table_manipulate.write_string_proc (file_out,str_json);

	Console.WriteLine("*** end ***");
}


// --------------------------------------------------------------------
static string json_convert_proc (string str_json)
{
	str_json = json_omit_proc (str_json,"\"_id");
	str_json = json_omit_proc (str_json,"\"_rev");

	return	str_json;
}

// --------------------------------------------------------------------
static string json_omit_proc (string str_json,string word_omit)
{
	int	it_id = str_json.IndexOf (word_omit,0);

	Console.WriteLine ("*** json_omit_proc ***");

	Console.WriteLine ("it_id = " + it_id);

	if (0 <  it_id)
		{
		int	it_comma = str_json.IndexOf (",",it_id);
		Console.WriteLine ("it_comma = " + it_comma);
		int nn= it_comma - it_id + 1;
		str_json = str_json.Remove (it_id,nn);
		}

	return	str_json;
}

// --------------------------------------------------------------------

// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
