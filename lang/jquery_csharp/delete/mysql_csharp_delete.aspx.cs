// ----------------------------------------------------------------
//	mysql_csharp_update.aspx.cs
//
//
//					Nov/12/2013
//
// ----------------------------------------------------------------
using System;
using System.IO;
using System.Data;
using	System.Collections.Generic;
using	MySql.Data.MySqlClient;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class mysql_csharp_update : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";


//	string server="localhost";
	string server="host_dbase";
	string str_db="city";

	string str_connect = "Server=" + server +
		";User Id=scott;Password=tiger;" +
		"Database=" + str_db + ";";

	MySqlConnection connection = new MySqlConnection (str_connect);
	connection.Open ();


	DataTable dtx = request_parser_proc ();

	for (int it=0; it< dtx.Rows.Count; it++)
                {
                DataRow dr = dtx.Rows[it];
		string id_aa = dr["id"].ToString ();
		Response.Write (id_aa + "\t");

		mysql_manipulate.mysql_delete_proc (connection,id_aa);
		}

	connection.Close ();

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
