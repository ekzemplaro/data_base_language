// --------------------------------------------------------------------
/*
	ftp_create.cpp

					Mar/04/2014
*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<sstream>
#include	<string>
#include	<map>

#include	<string.h>
#include	<boost/lexical_cast.hpp>
#include	<boost/foreach.hpp>

using namespace std;
// using namespace boost;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern string dict_to_json_proc (map <string,Unit> dict_aa);
extern void curl_put_proc (const char *url_target,string str_in);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t0361","盛岡",19754,"1922-3-8");
	dict_aa = dict_append_proc (dict_aa,"t0362","久慈",98235,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t0363","二戸",73128,"1922-8-28");
	dict_aa = dict_append_proc (dict_aa,"t0364","宮古",51486,"1922-9-21");
	dict_aa = dict_append_proc (dict_aa,"t0365","遠野",83971,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t0366","八幡平",75948,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t0367","大船渡",46785,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t0368","一関",59614,"1922-3-4");
	dict_aa = dict_append_proc (dict_aa,"t0369","花巻",71238,"1922-5-9");

	return	dict_aa;
}
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

//	char url_target[] = "ftp://scott:tiger@host_dbase/city/iwate.json"; 
	char url_target[] = "ftp://scott:tiger@cddn007/city/iwate.json"; 

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;

	string str_json = dict_to_json_proc (dict_aa);

	curl_put_proc (url_target,str_json);

	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
