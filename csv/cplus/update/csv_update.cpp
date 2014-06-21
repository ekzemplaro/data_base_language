// --------------------------------------------------------------------
/*
	csv_update.cpp

					Apr/21/2014


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
extern map <string,Unit> csv_read_proc (char file_in[]);
extern	void dict_display_proc (map <string,Unit> dict_aa);

extern	void csv_write_proc (char file_out[],map <string,Unit> dict_aa);

extern map <string,Unit> dict_update_proc
	(map <string,Unit> dict_aa,char id_in[],int population_in);

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cout << "*** 開始 ***\n";

	char	file_name[160];
	char	id_in[10];
	int	population_in;

	strcpy (file_name,argv[1]);

	strcpy (id_in,argv[2]);
	population_in = atoi (argv[3]);

	map <string,Unit> dict_aa = csv_read_proc (file_name);

	map <string,Unit> dict_bb = dict_update_proc (dict_aa,id_in,population_in);

	dict_display_proc (dict_bb);

	csv_write_proc (file_name,dict_bb);

	cout << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
