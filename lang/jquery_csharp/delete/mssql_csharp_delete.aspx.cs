// ----------------------------------------------------------------
//	mssql_csharp_delete.aspx.cs
//
//
//					May/24/2013
//
// ----------------------------------------------------------------
using	System;
using	System.IO;
using	System.Data;
using	System.Collections.Generic;
using	System.Data.SqlClient;

using	Newtonsoft.Json;
// ----------------------------------------------------------------
public class mssql_csharp_delete : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";

	Response.Write ("mssql_csharp_delete.aspx.cs ");

	string str_connect =
		@"server=host_mssql;"
		+ "uid=sa;" + "pwd=scott_tiger;" + "database=city;";



	DataTable dtable = table_manipulate.table_prepare_proc ();

	SqlConnection connection = new SqlConnection (str_connect);
	connection.Open ();

	mssql_manipulate.mssql_data_fetch_proc (connection,dtable);

	String[] array_aa = request_delete_parser_proc ();

	for (int it=0; it< array_aa.Length; it++)
                {
		String key_in = array_aa[it];
		Response.Write (key_in + "<br />");

		mssql_manipulate.row_delete_proc (connection,dtable,key_in);
		}

	connection.Close ();

	Response.Write ("May/23/2010");

	Response.Write ("OK");
}

// ----------------------------------------------------------------
String[] request_delete_parser_proc ()
{
	Response.Write ("request_parser_proc *** AM 08:12<br />");

	foreach (string ss in Request.Form)
		{
		Response.Write ("Form : " + ss + " ");
		string pp = Request.Form.Get (ss).ToString ();
		Response.Write ("Form.Get : " + pp + " ");
		}

	string str_json = Request.Form.Get ("my_data").ToString ();

	Response.Write ("str_json : " + str_json + "<br />");

	String []array_aa = JsonConvert.DeserializeObject <String []> (str_json);
	Response.Write ("Length : " + array_aa.Length + "<br />");

	return	array_aa;
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
