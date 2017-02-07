// ----------------------------------------------------------------
//	oracle_csharp_read.aspx.cs
//
//
//					Apr/02/2010
//
// ----------------------------------------------------------------
using System;
using System.Data;
using System.Data.OracleClient;

// ----------------------------------------------------------------
public class oracle_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	string str_connect =
//		"User Id=system;Password=hello9;Data Source=spn109:1521/orcl";
		"User Id=system;Password=hello9;Data Source=cpt003:1521/xe";

	string str_com = "select * from cities";

	OracleConnection connection = new OracleConnection (str_connect);

	OracleDataAdapter da_adapter = new OracleDataAdapter
			(str_com,str_connect);


	DataTable dtable = new DataTable ();

	connection.Open ();
	da_adapter.Fill (dtable);
	connection.Close ();


	string json_str = table_manipulate.table_json_str_proc (dtable);

	Response.Write (json_str);
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
