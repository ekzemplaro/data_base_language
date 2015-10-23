// -----------------------------------------------------------------------
/*
	json_delete.cpp

					Feb/27/2012
*/
// -----------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<cstring>
#include	<map>

// -----------------------------------------------------------------------
using namespace std;

typedef map<string,string> Unit;

extern map <string,Unit> json_to_dict_proc (string str_json);
extern	void dict_display_proc (map <string,Unit> dict_aa);

extern string dict_to_json_proc (map <string,Unit> dict_aa);
// -----------------------------------------------------------------------
int main (int argc, char* argv[])
{
	cout << "*** 開始 ***\n";

	char	file_json[160];
	char	key_in[10];

	strcpy (file_json,argv[1]);
	strcpy (key_in,argv[2]);

	cout << key_in << endl;

	ifstream fin;
	fin.open (file_json);
	string str_json;

	fin >> str_json;

	fin.close ();

	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_aa.erase (key_in);

	dict_display_proc (dict_aa);

	str_json = dict_to_json_proc (dict_aa);

	ofstream fp_out (file_json);
	fp_out << str_json;
	fp_out.close ();

	cout << "*** 終了 ***\n";

	return 0;
}

// -----------------------------------------------------------------------
