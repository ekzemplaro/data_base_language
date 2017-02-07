// ----------------------------------------------------------------
//	mssql_csharp_read.aspx.cs
//
//
//					Jan/17/2013
//
// ----------------------------------------------------------------
using System;
using System.Data;
using System.Data.SqlClient;

// ----------------------------------------------------------------
public class mssql_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";



	string str_connect =
		@"server=host_mssql;"
		+ "uid=sa;" + "pwd=scott_tiger;" + "database=city;";
 
	string command = "select ID,Name,Population,date_mod from cities";

	SqlDataAdapter da_adapter
			= new SqlDataAdapter (command,str_connect);

	DataTable dtable = new DataTable ();

	da_adapter.Fill (dtable);


	string json_str = table_manipulate.table_json_str_proc (dtable);

	Response.Write (json_str);
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
