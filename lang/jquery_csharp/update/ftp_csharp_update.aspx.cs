// ----------------------------------------------------------------
//	ftp_csharp_update.aspx.cs
//
//
//					Nov/12/2013
//
// ----------------------------------------------------------------
using	System;
using	System.IO;
using	System.Data;
using	System.Net;
using	System.Web;
using	System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class ftp_csharp_update : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";

	Response.Write ("ftp_csharp_update.aspx.cs ");

	string url = "ftp://host_dbase/city/iwate.json";

	string user = "scott";
	string passwd = "tiger";

	string str_json = ftp_manipulate.ftp_to_str_proc (url,user,passwd);

	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json);

	Response.Write ("*** rrrr ***<p />");

	DataTable dtx = request_parser_proc ();


	for (int it=0; it< dtx.Rows.Count; it++)
                {
                DataRow dr = dtx.Rows[it];
		String id_aa = dr["id"].ToString ();
		int population_aa = int.Parse (dr["population"].ToString ());
		Response.Write (id_aa + "\t");
		Response.Write (population_aa + "\t");

		dict_aa = text_manipulate.dict_update_proc
			(dict_aa,id_aa,population_aa);
		}

	string str_json_out = JsonConvert.SerializeObject (dict_aa);

	ftp_manipulate.str_to_ftp_proc (url,user,passwd,str_json_out);


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
