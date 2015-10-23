// --------------------------------------------------------------------
/*
	xml_manipulate.cpp

				Feb/28/2012

*/
// --------------------------------------------------------------------
#include	<string>
#include	<cstring>
#include	<iostream>
#include	<map>
#include	<libxml/xpath.h>
#include	<libxml/xmlreader.h>

// --------------------------------------------------------------------
using namespace std;

typedef map<string,string> Unit;

extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
// --------------------------------------------------------------------
string doc_parser_s2 (xmlDocPtr doc, xmlNodePtr cur)
{
	xmlChar *key;
	key = xmlNodeListGetString (doc,cur->xmlChildrenNode,1);
	char ch_key[20];
	sprintf (ch_key,"%s", key);
	xmlFree(key);

	return	ch_key;
}

// --------------------------------------------------------------------
map <string,Unit> doc_parser_proc
	(map <string,Unit> dict_aa,xmlDocPtr doc,xmlNodePtr cur)
{
	char ch_key[20];
	sprintf (ch_key,"%s", cur->name);

	string key_cur = string (ch_key);

if (key_cur != "text")
{
	xmlChar *key;
	cur = cur->xmlChildrenNode;
	Unit unit_aa;

	while (cur != NULL)
		{
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"name")))
			{
			unit_aa["name"] = doc_parser_s2 (doc,cur);
			}
		else if ((!xmlStrcmp(cur->name, (const xmlChar *)"population")))
			{
			unit_aa["population"] = doc_parser_s2 (doc,cur);
			}
		else if ((!xmlStrcmp(cur->name, (const xmlChar *)"date_mod")))
			{
			unit_aa["date_mod"] = doc_parser_s2 (doc,cur);
			}

		cur = cur->next;
		}

	string name = unit_aa["name"];

	dict_aa = dict_append_proc (dict_aa,key_cur,name,
			atoi (unit_aa["population"].c_str ()),
			unit_aa["date_mod"]);
}
	return	dict_aa;
}

// --------------------------------------------------------------------
// [4]:
map <string,Unit> xml_to_dict_proc (string str_xml)
{
	map <string,Unit> dict_aa;

	const char *buffer = str_xml.c_str ();

	xmlDocPtr doc;
	xmlNodePtr cur;

	doc = xmlParseMemory (buffer,strlen (buffer));

//	doc = xmlParseFile (file_in);

	if (doc == NULL )
		{
		cerr << "Document not parsed successfully. \n";
		}

	cur = xmlDocGetRootElement (doc);

	cur = cur->xmlChildrenNode;

//	cerr << "*** ccc ***\n";

	while (cur != NULL)
		{
		dict_aa = doc_parser_proc (dict_aa,doc,cur);
		cur = cur->next;
		}

	xmlFreeDoc (doc);

	return	dict_aa;
}

// --------------------------------------------------------------------
// [8-4-6]:
static string tag_out_proc (string str_key,string data_in)
{
	string str_out = "<";

	str_out += str_key;
	str_out += ">";
	str_out += data_in;
	str_out += "</";
	str_out += str_key;
	str_out += ">";

	return	str_out; 
}

// --------------------------------------------------------------------
// [8-4]:
static string data_prepare_unit (
	string id_in,string name_in,string population_in,string date_mod_in)
{
	string str_out = "<";
	str_out += id_in;
	str_out += ">";

	str_out += tag_out_proc ("name",name_in);

	str_out += tag_out_proc ("population",population_in);
	str_out += tag_out_proc ("date_mod",date_mod_in);

	str_out += "</";
	str_out += id_in;
	str_out += ">";

	return	str_out;
}

// --------------------------------------------------------------------
// [8]:
string dict_to_xml_proc (map <string,Unit> dict_aa)
{
	string str_out = "<?xml version=\"1.0\" encoding=\"utf-8\"?><root>\n";

	map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		Unit unit_aa = (*it).second;

		string key_aa = (*it).first;

		str_out += data_prepare_unit (key_aa,unit_aa["name"],
				unit_aa["population"],unit_aa["date_mod"]);
		it++;
		}


	str_out += "</root>\n";

	return	str_out;
}

// --------------------------------------------------------------------
