// -----------------------------------------------------------------------
/*
	json_read.cpp

					Feb/11/2018
*/
// -----------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<string>
#include	<cstring>
#include	<map>

// -----------------------------------------------------------------------
using namespace std;

typedef	map<string,string> Unit;

extern	map <string,Unit> json_to_dict_proc (string str_json);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	string file_to_str_proc (char file_in[]);
// -----------------------------------------------------------------------
int main (int argc, char* argv[])
{
	cerr << "*** 開始 ***\n";

	char file_in[160];

	strcpy (file_in,argv[1]);

	string str_json = file_to_str_proc (file_in);

	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// -----------------------------------------------------------------------
