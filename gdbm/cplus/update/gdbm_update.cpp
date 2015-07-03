// --------------------------------------------------------------------
/*
	gdbm_update.cpp

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

// typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern string json_update_proc (string json_str,int population_in);
// --------------------------------------------------------------------
void gdbm_update_proc (char file_in[],char key_in[],int population_in)
{
	GDBM_FILE dbf = gdbm_open (file_in,512,GDBM_WRCREAT,0644,0);
	assert( dbf != nullptr );

	datum key;
	datum content;

	key.dptr = key_in;
	key.dsize = strlen(key_in) + 1;

	content = gdbm_fetch (dbf, key);

	if ( content.dptr == nullptr )
		{
		cerr << key_in << " not found..." << endl;
		}
	else
		{

	cout << "key = " << key.dptr << endl;
	cout << content.dptr << endl;

	string json_str = content.dptr;

	string json_str_new = json_update_proc (json_str,population_in);

	cout << json_str_new << endl;

	datum content_new;
	content_new.dptr = const_cast<char*>(json_str_new.c_str ());
	content_new.dsize = strlen(json_str_new.c_str ()) + 1;

	int result = gdbm_store (dbf,key,content_new,GDBM_REPLACE);
	assert( result == 0 );
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

	char	key_in[10];
	int	population_in;
	strcpy (key_in,argv[2]);

	population_in = atoi (argv[3]);

	cerr << key_in << '\t';
	cerr << population_in << endl;

	gdbm_update_proc (file_gdbm,key_in,population_in);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
