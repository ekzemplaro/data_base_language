// ----------------------------------------------------------------
//	master_csharp_update.aspx.cs
//
//
//					Apr/19/2010
//
// ----------------------------------------------------------------
using System;
using System.IO;
using System.Data;
using	System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class master_aa
{

// ----------------------------------------------------------------
static void Main()
{


	request_parser ();

}

// ----------------------------------------------------------------
static void request_parser ()
{

	string str_json = "[{\"id\":\"2385\",\"population\":\"90\"}]";

//	json_params arry_params
//		 = JsonConvert.DeserializeObject <json_params> (str_json);
	DataTable dt_aa
		 = JsonConvert.DeserializeObject <DataTable> (str_json);

	Console.WriteLine ("str_json : " + str_json + " ");

	Console.WriteLine (dt_aa.Rows.Count);

	for (int it=0; it< dt_aa.Rows.Count; it++)
                {
                DataRow dr = dt_aa.Rows[it];
		Console.Write (dr["id"] + "\t");
		Console.WriteLine (dr["population"]);
		}
}

// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
public class json_params
{
	public List <param_req> params_aa = new List <param_req> ();
}

// ----------------------------------------------------------------
public class param_req
{
	public int	id;
	public int	population;
}

// ----------------------------------------------------------------
