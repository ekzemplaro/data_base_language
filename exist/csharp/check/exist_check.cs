/* ----------------------------------------------------------------- */
/*
	exist_check.cs

				May/12/2010
*/
/* ----------------------------------------------------------------- */
#define	DEBUG
/* ----------------------------------------------------------------- */
using	System;
using	System.Text;
using	System.IO;
using	System.Data;
using	System.Diagnostics;
using	System.Xml;
using	System.Net;

/* ----------------------------------------------------------------- */

public	class	exist_check
{
/* ----------------------------------------------------------------- */
public	static void Main (string [] args)
{
	Console.WriteLine  ("*** May/12/2010 ***");

	const string url_exist=@"http://172.20.180.155:8086/exist/rest/";
	string record = "cities/cities.xml";
	StringBuilder stb_url_in = new StringBuilder (url_exist + record);
	string url_in =  stb_url_in.ToString ();

	string xml_string = get_xml_from_exist (url_in);

	DataTable dtable = table_manipulate.xmlstr_to_table_proc (xml_string);

	table_manipulate.display_proc (dtable);


	Console.WriteLine  ("*** end ***");
}


/* ----------------------------------------------------------------- */
/* [4-6-8]: */
static string get_xml_from_exist (string url_in)
{
	WebClient web_c = new System.Net.WebClient();

	web_c.Encoding = System.Text.Encoding.UTF8;

	string source = "";

	try
		{
		source = web_c.DownloadString (url_in);
		}
	catch	(Exception exp)
		{
		Console.Error.WriteLine ("*** get_xml_from_exist ***");
		Console.Error.WriteLine ("\t" + url_in);
		Console.Error.WriteLine ("*** error *** " + exp);
		Environment.Exit (1);
		}


	web_c.Dispose();

	return	source;
}

/* ----------------------------------------------------------------- */

}
/* ----------------------------------------------------------------- */
