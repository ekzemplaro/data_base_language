// --------------------------------------------------------------------
/*
	text_create.cpp

					Feb/28/2012

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

extern	void text_write_proc (char file_out[],map <string,Unit> dict_aa);

// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t2381","名古屋",79126,"1922-10-7");

	dict_aa = dict_append_proc (dict_aa,"t2382","豊橋",98231,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t2383","岡崎",13459,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t2384","一宮",51486,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t2385","蒲郡",83972,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t2386","常滑",74829,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t2387","大府",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t2388","瀬戸",59614,"1922-3-4");
	dict_aa = dict_append_proc (dict_aa,"t2389","犬山",71823,"1922-5-8");

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

	text_write_proc (file_out,dict_aa);

	cout << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
