// --------------------------------------------------------------------
/*
	mcachedb_read.cpp

				Feb/10/2015

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>
#include	<boost/algorithm/string.hpp>

using namespace std;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern  map <string,Unit > mcached_to_dict_proc
	(char server[],int port,int nmax,string keys []);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	string keys[] = {"t1521","t1522","t1523","t1524","t1525", 
			"t1526","t1527","t1528","t1529",
			"t1530","t1531","t1532"};

	int nmax = sizeof(keys) / sizeof(keys[0]);
	cout << nmax << "\n";

	char server[] = "host_ubuntu1";
	int port = 21201;

	map <string,Unit> dict_aa
		= mcached_to_dict_proc (server,port,nmax,keys);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

