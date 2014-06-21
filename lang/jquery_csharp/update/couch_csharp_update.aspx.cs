// ----------------------------------------------------------------
//	couch_csharp_update.aspx.cs
//
//
//					Aug/02/2011
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
public class couch_csharp_update : System.Web.UI.Page {

// ----------------------------------------------------------------
void Page_Load (Object sender, EventArgs e)
{
	Response.ContentType = "text/plain";

	Response.Write ("couch_csharp_update.aspx.cs ");

	string url_aa = "http://host_dbase:5984/city/cities";

	string user = "";
	string password = "";

	string str_json = get_uri.get_uri_proc (url_aa,user,password);


	Dictionary <string,Object> dict_bb
		= JsonConvert.DeserializeObject
			<Dictionary <string,Object>> (str_json);

Object idx = dict_bb["_id"];
	Object revx = dict_bb["_rev"];

	Response.Write ("*** pppp ***<p />");

	dict_bb.Remove ("_id");
	dict_bb.Remove ("_rev");

string str_json_bb = JsonConvert.SerializeObject (dict_bb);
	Response.Write ("*** qqqq ***<p />");

	Response.Write (str_json_bb);

	Dictionary <string,Object> dict_aa
		 = json_manipulate.json_to_dict_proc (str_json_bb);

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

	dict_aa["_id"] = idx;
	dict_aa["_rev"] = revx;

	string str_json_out = JsonConvert.SerializeObject (dict_aa);

	get_uri.put_uri_string_proc (url_aa,str_json_out,user,password);


	Response.Write ("*** Aug/02/2011 *** PM 14:00 ");

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
