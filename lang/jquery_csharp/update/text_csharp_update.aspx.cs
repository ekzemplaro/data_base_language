// ----------------------------------------------------------------
//	text_csharp_update.aspx.cs
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
public class text_csharp_update : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";

	Response.Write ("text_csharp_update.aspx.cs ");

	string	file_in = @"/var/tmp/plain_text/cities.txt";

	DataTable dtble =  table_manipulate.file_read_proc (file_in);

	DataTable dtx = request_parser_proc ();

	for (int it=0; it< dtx.Rows.Count; it++)
                {
                DataRow dr = dtx.Rows[it];
		string id_aa = dr["id"].ToString ();
		int population_aa = int.Parse (dr["population"].ToString ());
		Response.Write (id_aa + "\t");
		Response.Write (population_aa + "\t");

		table_manipulate.update_proc (ref dtble,id_aa,population_aa);
		}

	Response.Write ("Apr/19/2010 ");

	table_manipulate.file_write_proc (dtble,file_in);

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
