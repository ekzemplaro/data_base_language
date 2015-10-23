// ----------------------------------------------------------------
//	postgre_csharp_read.aspx.cs
//
//
//					Jan/31/2011
//
// ----------------------------------------------------------------
using System;
using System.Data;
using Npgsql;

// ----------------------------------------------------------------
public class postgre_csharp_read : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{
	Response.ContentType = "text/json";

//	string server="cpt003";
	string server="localhost";
	string port="5432";
	string str_db="city";

	string str_connect = "Server=" + server + ";Port=" + port + 
	";User Id=scott;Password=tiger;" +
		"ENCODING=UNICODE;Database=" + str_db + ";";

	string str_com = "select * from cities";

	NpgsqlDataAdapter da_adapter = new NpgsqlDataAdapter
			(str_com,str_connect);

	Console.WriteLine("*** start ***");

	DataTable dtable = new DataTable ();

	da_adapter.Fill (dtable);


	string json_str = table_manipulate.table_json_str_proc (dtable);

	Response.Write (json_str);
}
// ----------------------------------------------------------------
}
// ----------------------------------------------------------------
