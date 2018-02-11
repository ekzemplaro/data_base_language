// --------------------------------------------------------------------
/*
	text_delete.cpp

					Feb/11/2018

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<string>
#include	<cstring>
#include	<map>

#include	<boost/lexical_cast.hpp>

using namespace std;
using namespace boost;

// --------------------------------------------------------------------
typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern map <string,Unit> text_read_proc (char file_in[]);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	void text_write_proc (char file_out[],map <string,Unit> dict_aa);

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char	file_name[160];
	char	key_in[10];

	strcpy (file_name,argv[1]);
	strcpy (key_in,argv[2]);

	cout << key_in << endl;

	map <string,Unit> dict_aa = text_read_proc (file_name);

	string key = lexical_cast<string>(key_in);
	dict_aa.erase (key);

	text_write_proc (file_name,dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
