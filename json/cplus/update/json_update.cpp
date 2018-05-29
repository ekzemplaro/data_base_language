// -----------------------------------------------------------------------
/*
	json_update.cpp

					Mar/28/2018
*/
// -----------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<string>
#include	<cstring>
#include	<cstdlib>
#include	<map>

// -----------------------------------------------------------------------
using namespace std;

typedef map<string,string> Unit;

extern	string file_to_str_proc (char file_in[]);
extern void file_write_proc (char file_out[], string str_out);
extern map <string,Unit> json_to_dict_proc (string str_json);
extern map <string,Unit> dict_update_proc
	(map <string,Unit> dict_aa,char key_in[],int population_in);

extern string dict_to_json_proc (map <string,Unit> dict_aa);
// -----------------------------------------------------------------------
int main (int argc, char* argv[])
{
	cerr << "*** 開始 ***\n";

	char	file_json[160];
	char	key_in[10];
	int	population_in;

	strcpy (file_json,argv[1]);
	strcpy (key_in,argv[2]);
	population_in = atoi (argv[3]);

	cout << key_in << '\t';
	cout << population_in << endl;

	string str_json = file_to_str_proc (file_json);

	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	cerr << "*** ccc ***\n";
	dict_aa = dict_update_proc (dict_aa,key_in,population_in);
	cerr << "*** ddd ***\n";

	str_json = dict_to_json_proc (dict_aa);

	file_write_proc (file_json,str_json);

	cerr << "*** 終了 ***\n";

	return 0;
}

// -----------------------------------------------------------------------
