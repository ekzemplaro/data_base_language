// --------------------------------------------------------------------
/*
	text_delete.cpp

					Jun/06/2011


*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<string>
#include	<cstring>
#include	<cstdlib>
#include	<ctime>
#include	<map>

#include	<boost/lexical_cast.hpp>

using namespace std;
using namespace boost;

// --------------------------------------------------------------------
typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern map <string,Unit> csv_read_proc (char file_in[]);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	void csv_write_proc (char file_out[],map <string,Unit> dict_aa);

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cout << "*** 開始 ***\n";

	char	file_name[160];
	char	id_in[10];

	strcpy (file_name,argv[1]);

	strcpy (id_in,argv[2]);

	cout << id_in << endl;

	map <string,Unit> dict_aa = csv_read_proc (file_name);

	string key = lexical_cast<string>(id_in);
	dict_aa.erase (key);

	dict_display_proc (dict_aa);

	csv_write_proc (file_name,dict_aa);

	cout << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
