// --------------------------------------------------------------------
/*
	xml_create.cpp
				Feb/28/2012

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<sstream>
#include	<string>
#include	<map>

#include	<string.h>

using namespace std;

typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
extern string dict_to_xml_proc (map <string,Unit> dict_aa);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t2261","静岡",76394,"1922-11-5");

	dict_aa = dict_append_proc (dict_aa,"t2262","浜松",93157,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t2263","沼津",23419,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t2264","三島",51476,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t2265","富士",83971,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t2266","熱海",72948,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t2267","富士宮",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t2268","藤枝",59614,"1922-3-4");
	dict_aa = dict_append_proc (dict_aa,"t2269","御殿場",71823,"1922-5-9");
	dict_aa = dict_append_proc (dict_aa,"t2270","島田",83572,"1922-10-7");

	return	dict_aa;
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cout << "*** 開始 ***\n";

	char file_out[160];

	strcpy (file_out,argv[1]);

	cout << "\tfile_out = " << file_out << "\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	string str_xml = dict_to_xml_proc (dict_aa);

	ofstream fp_out (file_out);

	fp_out << str_xml;

	fp_out.close ();

	cout << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
