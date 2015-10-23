// --------------------------------------------------------------------
/*
	gdbm_create.cpp

				Jun/18/2015


*/
// --------------------------------------------------------------------
#include <iostream>
#include <cassert>
#include <array>
#include <map>
#include <cstring> // strlen
#include <cstdlib> // free

#define GDBM_STATIC
#include <gdbm.h>

using namespace std;

typedef map<string,string> Unit;

extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern string unit_to_json_proc (Unit unit_aa);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t2151","岐阜",79126,"1922-10-7");

	dict_aa = dict_append_proc (dict_aa,"t2152","大垣",98231,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t2153","多治見",13459,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t2154","各務原",51486,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t2155","土岐",83972,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t2156","高山",74829,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t2157","美濃加茂",46185,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t2158","恵那",59614,"1922-3-4");
	dict_aa = dict_append_proc (dict_aa,"t2159","関",71823,"1922-5-8");

	return	dict_aa;
}

// --------------------------------------------------------------------
void dict_to_gdbm_proc (char file_gdbm[],map <string,Unit> dict_aa)
{
	GDBM_FILE dbf = gdbm_open (file_gdbm, 512, GDBM_NEWDB, 0644, 0);
  assert( dbf != nullptr );

	map <string,Unit>:: iterator itr = dict_aa.begin ();
	datum key;
	datum content;

	while (itr != dict_aa.end ())
		{
		string key_in = (*itr).first;
		Unit unit_aa = (*itr).second;

		string json_str = unit_to_json_proc (unit_aa);

		key.dptr = const_cast<char*>(key_in.c_str ());
		key.dsize = strlen(key_in.c_str ()) + 1;
		content.dptr = const_cast<char*>(json_str.c_str ());
		content.dsize = strlen(json_str.c_str ()) + 1;

		int result = gdbm_store(dbf, key, content, GDBM_REPLACE);
		assert( result == 0 );
		itr++;
		}

	gdbm_close(dbf);
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char file_gdbm[160];

	strcpy (file_gdbm,argv[1]);

	cerr << "file_gdbm = " << file_gdbm << "\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	dict_to_gdbm_proc (file_gdbm,dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
