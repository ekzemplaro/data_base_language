// ----------------------------------------------------------------
//	mysql_csharp_read.aspx.cs
//
//
//					May/10/2011
//
// ----------------------------------------------------------------
using System;
using System.Data;
using MySql.Data.MySqlClient;

// ----------------------------------------------------------------
public class mysql_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

	string server="host_mysql";
	string str_db="city";

	string str_connect = "Server=" + server + 
	";User Id=scott;Password=tiger;" +
		"Database=" + str_db + ";";

	string str_com = "select * from cities";

	MySqlDataAdapter da_adapter = new MySqlDataAdapter
			(str_com,str_connect);

	Console.WriteLine ("*** mysql_adapter *** start ***");

	DataTable dtable = new DataTable ();

	da_adapter.Fill (dtable);

	string json_str = table_manipulate.table_json_str_proc (dtable);

	Response.Write (json_str);
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
