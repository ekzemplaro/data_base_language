// ----------------------------------------------------------
/*
	xml_read.cpp

				Feb/27/2012

*/
// ----------------------------------------------------------
#include	<string>
#include	<cstring>
#include	<iostream>
#include	<fstream>
#include	<map>
#include	<libxml/xpath.h>
#include	<libxml/xmlreader.h>

// ----------------------------------------------------------
using namespace std;

typedef map<string,string> Unit;

extern	string file_to_str_proc (char file_in[]);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> xml_to_dict_proc (string str_xml);
// ----------------------------------------------------------
int main (int argc, char* argv[])
{
	char file_in[160];

	cout << "*** 開始 ***\n";

	strcpy (file_in,argv[1]);

	string  str_xml = file_to_str_proc (file_in);

	map <string,Unit> dict_aa =  xml_to_dict_proc (str_xml);

	dict_display_proc (dict_aa);

	cout << "*** 終了 ***\n";

	return 0;
}

// ----------------------------------------------------------
