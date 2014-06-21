// ----------------------------------------------------------------
//	mssql_csharp_update.aspx.cs
//
//
//					Jul/18/2011
//
// ----------------------------------------------------------------
using System;
using System.IO;
using System.Data;
using	System.Collections.Generic;
using	System.Data.SqlClient;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class mssql_csharp_update : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";

	Response.Write ("mssql_csharp_update.aspx.cs ");

	string str_connect =
		@"server=host_mssql;"
		+ "uid=sa;" + "pwd=scott_tiger;" + "database=city;";



	DataTable dtable = table_manipulate.table_prepare_proc ();

	SqlConnection connection = new SqlConnection (str_connect);
	connection.Open ();

	mssql_manipulate.mssql_data_fetch_proc (connection,dtable);

	DataTable dtx = request_parser_proc ();

	for (int it=0; it< dtx.Rows.Count; it++)
                {
                DataRow dr = dtx.Rows[it];
		string id_aa = dr["id"].ToString ();
		int population_aa = int.Parse (dr["population"].ToString ());
		Response.Write (id_aa + "\t");
		Response.Write (population_aa + "\t");

		mssql_manipulate.mssql_table_update_proc
			(connection,ref dtable,id_aa,population_aa);
		}

	connection.Close ();


	Response.Write ("Apr/22/2010 ");

	Response.Write ("OK");
}

// ----------------------------------------------------------------
DataTable request_parser_proc ()
{
	foreach (string ss in Request.Form)
		{
		Response.Write ("Form : " + ss + " ");
		string pp = Request.Form.Get (ss).ToString ();
		Response.Write ("Form.Get : " + pp + " ");
		}

	string str_json = Request.Form.Get ("my_data").ToString ();

	Response.Write ("str_json : " + str_json + " ");

	DataTable dt_aa
		 = JsonConvert.DeserializeObject <DataTable> (str_json);

	Console.WriteLine ("str_json : " + str_json + " ");

	Console.WriteLine (dt_aa.Rows.Count);

	return	dt_aa;
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
