// ----------------------------------------------------------------
/*
	xml_manipulate.boo

					Oct/03/2011

*/
// ----------------------------------------------------------------
import	System
import	System.Text
import	System.Xml

// ----------------------------------------------------------------

// --------------------------------------------------------------------
def tag_out_proc (tag,value):
	st = StringBuilder ()

	st.Append ("\t<")
	st.Append (tag)
	st.Append (">")

	st.Append (value)

	st.Append ("</")
	st.Append (tag)
	st.Append (">\n")

	return	st.ToString ()

// --------------------------------------------------------------------
def dict_to_xml_proc (dict_aa as Hashtable):
	st = StringBuilder ()

	st.Append ("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
	st.Append ("<root>\n")

	for key in dict_aa.Keys:
		unit_aa as Hashtable = dict_aa[key]

		st.Append ("<")
		st.Append (key)
		st.Append (">\n")

		st.Append (tag_out_proc ("name",unit_aa["name"]))
		st.Append (tag_out_proc ("population",unit_aa["population"]))
		st.Append (tag_out_proc ("date_mod",unit_aa["date_mod"]))
		
		st.Append ("</")
		st.Append (key)
		st.Append (">\n")

	st.Append ("</root>\n")

	return	st.ToString ()

// --------------------------------------------------------------------
def xml_to_dict_proc (str_xml):
	dict_aa = {}

	xmlDoc = XmlDocument() 
	xmlDoc.LoadXml (str_xml)

	nodeList = xmlDoc.SelectNodes("/root")
	root = nodeList[0]


//	keys= [root.ChildNodes.Count]
//	keys= array(typeof(string),100)

	keys = ("aa","bb","cc","dd","ee","ff","gg","hh","ii","jj","kk","ll")

	if (root.HasChildNodes):
		for it in range (root.ChildNodes.Count):
			keys[it] = root.ChildNodes[it].Name

	for key in keys:
		dict_aa = record_convert_proc (xmlDoc,key,dict_aa)

	return	dict_aa

// ----------------------------------------------------------------
def record_convert_proc (xmlDoc as XmlDocument,key,dict_aa as Hashtable):
	row_aa = "/root/" + key

	xNode = xmlDoc.SelectSingleNode (row_aa + "/name") 

	if (xNode != null):
		name = xNode.InnerText

		xNode = xmlDoc.SelectSingleNode (row_aa + "/population") 
		population = xNode.InnerText

		xNode = xmlDoc.SelectSingleNode (row_aa + "/date_mod") 
		date_mod = xNode.InnerText

		unit_aa = {}

		unit_aa.Add ("name",name)
		unit_aa.Add ("population",population)
		unit_aa.Add ("date_mod",date_mod)

		dict_aa.Add (key,unit_aa)

	return	dict_aa

// --------------------------------------------------------------------
