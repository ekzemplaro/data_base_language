// ----------------------------------------------------------------
//	xindice_csharp_read.aspx.cs
//
//
//					Sep/18/2011
//
// ----------------------------------------------------------------
using System;
using System.Data;
using	System.Collections.Generic;

using Newtonsoft.Json;
// ----------------------------------------------------------------
public class xindice_csharp_update : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load(Object sender, EventArgs e)
{

	Response.ContentType = "text/json";

	string url = "http://cdbd026:8888/xindice/db/cities/cities";

	string user = "";
	string password = "";
	string str_xml = get_uri.get_uri_proc (url,user,password);

	Dictionary <string,Object> dict_aa
		 = xml_manipulate.xml_to_dict_proc (str_xml);

	DataTable dtx = request_parser_proc ();

	for (int it=0; it< dtx.Rows.Count; it++)
                {
                DataRow dr = dtx.Rows[it];
		string id_aa = dr["id"].ToString ();
		int population_aa = int.Parse (dr["population"].ToString ());
		Response.Write (id_aa + "\t");
		Response.Write (population_aa + "\t");

		dict_aa = text_manipulate.dict_update_proc
				(dict_aa,id_aa,population_aa);
		}

	Response.Write ("Sep/18/2011 ");

	string xml_str = xml_manipulate.dict_to_xml_proc (dict_aa);

	get_uri.put_uri_string_proc (url,xml_str,user,password);


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

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
