// --------------------------------------------------------------------
/*
	csv_create.cpp

					Apr/21/2014

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<map>

#include	<string.h>
#include	<boost/lexical_cast.hpp>

using namespace std;
using namespace boost;

typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern	void csv_write_proc (char file_out[],map <string,Unit> dict_aa);

// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t1271","千葉",75196,"1986-8-17");

	dict_aa = dict_append_proc (dict_aa,"t1272","勝浦",13982,"1986-9-8");
	dict_aa = dict_append_proc (dict_aa,"t1273","市原",47621,"1986-7-25");
	dict_aa = dict_append_proc (dict_aa,"t1274","流山",29517,"1986-6-14");
	dict_aa = dict_append_proc (dict_aa,"t1275","八千代",54271,"1986-1-5");
	dict_aa = dict_append_proc (dict_aa,"t1276","我孫子",76948,"1986-5-22");
	dict_aa = dict_append_proc (dict_aa,"t1277","鴨川",46785,"1986-7-17");
	dict_aa = dict_append_proc (dict_aa,"t1278","銚子",52614,"1986-3-04");
	dict_aa = dict_append_proc (dict_aa,"t1279","市川",74823,"1986-5-9");

	return	dict_aa;
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cout << "*** 開始 ***\n";

	char file_out[160];

	strcpy (file_out,argv[1]);

//	cerr << "\tfile_out = " << file_out << "\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;

	dict_display_proc (dict_aa);

	csv_write_proc (file_out,dict_aa);

	cout << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
