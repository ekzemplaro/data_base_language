// --------------------------------------------------------------------
/*
	json_create.cpp

				Feb/24/2012
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
using namespace boost;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern string dict_to_json_proc (map <string,Unit> dict_aa);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t0921","宇都宮",26381,"1922-10-8");

	dict_aa = dict_append_proc (dict_aa,"t0922","小山",98237,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t0923","佐野",23158,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t0924","足利",51486,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t0925","日光",83971,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t0926","下野",74968,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t0927","さくら",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t0928","矢板",59614,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t0929","真岡",71823,"1922-5-9");
	dict_aa = dict_append_proc (dict_aa,"t0930","栃木",82361,"1922-8-12");
	dict_aa = dict_append_proc (dict_aa,"t0931","大田原",36128,"1922-5-25");
	dict_aa = dict_append_proc (dict_aa,"t0932","鹿沼",19254,"1922-4-8");
	dict_aa = dict_append_proc (dict_aa,"t0933","那須塩原",35682,"1922-3-17");
	dict_aa = dict_append_proc (dict_aa,"t0934","那須烏山",24635,"1922-2-21");

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

	string str_json = dict_to_json_proc (dict_aa);

	ofstream fp_out (file_out);
	fp_out << str_json;
	fp_out.close ();

	cout << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
