// ----------------------------------------------------------
/*
	xml_delete.cpp

				Feb/28/2012

*/
// ----------------------------------------------------------
#include	<string>
#include	<cstring>
#include	<iostream>
#include	<fstream>
#include	<map>
#include	<libxml/xpath.h>
#include	<libxml/xmlreader.h>

#include	<boost/lexical_cast.hpp>
// ----------------------------------------------------------
using namespace std;
using namespace boost;

typedef map<string,string> Unit;

extern	string file_to_str_proc (char file_in[]);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> xml_to_dict_proc (string str_xml);
extern string dict_to_xml_proc (map <string,Unit> dict_aa);
// ----------------------------------------------------------
int main (int argc, char* argv[])
{
	char file_xml[160];
	char	key_in[10];

	cerr << "*** 開始 ***\n";

	strcpy (file_xml,argv[1]);
	strcpy (key_in,argv[2]);

	cout << key_in << endl;

	string  str_xml = file_to_str_proc (file_xml);

	map <string,Unit> dict_aa =  xml_to_dict_proc (str_xml);

	string key = lexical_cast<string>(key_in);
	dict_aa.erase (key);

	dict_display_proc (dict_aa);

	str_xml = dict_to_xml_proc (dict_aa);

	ofstream fp_out (file_xml);

	fp_out << str_xml;

	fp_out.close ();

	cerr << "*** 終了 ***\n";

	return 0;
}

// ----------------------------------------------------------
