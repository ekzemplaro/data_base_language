// ----------------------------------------------------------------
/*
	xml_manipulate.cs

					Sep/18/2011

*/
// ----------------------------------------------------------------
using	System;
using	System.Text;
using	System.Xml;
using	System.Collections.Generic;

// ----------------------------------------------------------------
public static class	xml_manipulate
{

// --------------------------------------------------------------------
static String tag_out_proc (String tag,String value)
{
	StringBuilder st = new StringBuilder ();

	st.Append ("\t<");
	st.Append (tag);
	st.Append (">");

	st.Append (value);

	st.Append ("</");
	st.Append (tag);
	st.Append (">\n");

	return	st.ToString ();
}

// --------------------------------------------------------------------
public static String dict_to_xml_proc (Dictionary <string,Object> dict_aa)
{
	StringBuilder st = new StringBuilder ();

	st.Append ("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
	st.Append ("<root>\n");

	foreach (KeyValuePair<string, Object> kv in dict_aa)
		{
		Dictionary <string,string> unit_aa
			= (Dictionary <string,string>)kv.Value;

		st.Append ("<");
		st.Append (kv.Key);
		st.Append (">\n");

		st.Append (tag_out_proc ("name",unit_aa["name"]));
		st.Append (tag_out_proc ("population",unit_aa["population"]));
		st.Append (tag_out_proc ("date_mod",unit_aa["date_mod"]));
		
		st.Append ("</");
		st.Append (kv.Key);
		st.Append (">\n");

		}

	st.Append ("</root>\n");
	return	st.ToString ();
}

// --------------------------------------------------------------------
public static Dictionary <string,Object> xml_to_dict_proc (String str_xml)
{
	Dictionary <string,Object> dict_aa
			= new Dictionary <string,Object> ();

	XmlDocument xmlDoc = new XmlDocument(); 
	xmlDoc.LoadXml (str_xml);

	XmlNodeList nodeList = xmlDoc.SelectNodes("/root");
	XmlNode root = nodeList[0];

	string [] keys = new string[root.ChildNodes.Count];

	if (root.HasChildNodes)
		{
		for (int it=0; it<root.ChildNodes.Count; it++)
			{
			keys[it] = root.ChildNodes[it].Name;
			}
		}

	foreach (string key in keys)
		{
		dict_aa = record_convert_proc (xmlDoc,key,dict_aa);
		}

	return	dict_aa;
}

// ----------------------------------------------------------------
static Dictionary <string,Object> record_convert_proc
	(XmlDocument xmlDoc,string key,Dictionary <string,Object> dict_aa)
{
	string row_aa = "/root/" + key;

	XmlNode xNode = xmlDoc.SelectSingleNode (row_aa + "/name"); 

if (xNode != null)
	{
	string name = xNode.InnerText;

	xNode = xmlDoc.SelectSingleNode (row_aa + "/population"); 
	string population = xNode.InnerText;

	xNode = xmlDoc.SelectSingleNode (row_aa + "/date_mod"); 
	string date_mod = xNode.InnerText;

	Dictionary <string,string> unit_aa
			= new Dictionary <string,string> ();

		unit_aa.Add ("name",name);
		unit_aa.Add ("population",population);
		unit_aa.Add ("date_mod",date_mod);

	dict_aa.Add (key,unit_aa);
	}

	return	dict_aa;
}
// --------------------------------------------------------------------
}
// --------------------------------------------------------------------
