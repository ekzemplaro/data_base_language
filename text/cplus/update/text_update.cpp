// --------------------------------------------------------------------
/*
	text_update.cpp

					Feb/11/2018
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
#include	<boost/date_time/gregorian/gregorian.hpp>

using namespace std;
using namespace boost;

// --------------------------------------------------------------------
typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern map <string,Unit> text_read_proc (char file_in[]);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	void text_write_proc (char file_out[],map <string,Unit> dict_aa);

extern map <string,Unit> dict_update_proc
	(map <string,Unit> dict_aa,char id_in[],int population_in);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char	file_name[160];
	char	key_in[10];
	int	population_in;

	strcpy (file_name,argv[1]);
	strcpy (key_in,argv[2]);

	population_in = atoi (argv[3]);

	cout << key_in << '\t';
	cout << population_in << endl;

	map <string,Unit> dict_aa = text_read_proc (file_name);

	dict_aa = dict_update_proc (dict_aa,key_in,population_in);

	text_write_proc (file_name,dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
