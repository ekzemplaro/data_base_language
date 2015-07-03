// --------------------------------------------------------------------
/*
	gdbm_read.cpp

				Jun/18/2015


*/
// --------------------------------------------------------------------
#include <iostream>
#include <cassert>
#include <array>
#include <cstring> // strlen
#include <cstdlib> // free
#include	<map>

#define GDBM_STATIC
#include <gdbm.h>

using namespace std;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern	Unit json_to_unit_proc (string json_str);
extern	void dict_display_proc (map <string,Unit> dict_aa);
// --------------------------------------------------------------------
map <string,Unit> gdbm_to_dict_proc (char file_in[])
{
	GDBM_FILE dbf = gdbm_open (file_in,512,GDBM_WRCREAT,0644,0);
	assert( dbf != nullptr );

	map <string,Unit> dict_aa;

	datum key;
	datum content;

	key = gdbm_firstkey (dbf);
	while (key.dptr != nullptr )
	{
	content = gdbm_fetch (dbf, key);
//    cout << key.dptr << " = " << content.dptr << endl;
//	cout << "key = " << key.dptr << endl;
	dict_aa[key.dptr] =  json_to_unit_proc (content.dptr);
	free (content.dptr);
	key = gdbm_nextkey (dbf, key);
	}

	return	dict_aa;
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char file_gdbm[160];

	strcpy (file_gdbm,argv[1]);

	cerr << "file_gdbm = " << file_gdbm << "\n";

	map <string,Unit> dict_aa = gdbm_to_dict_proc (file_gdbm);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
