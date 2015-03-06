// --------------------------------------------------------------------
/*
	tyrant_read.cpp

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

	char server[] = "host_ubuntu1";
	int port = 1978;

	string keys[] = {"t4761","t4762","t4763","t4764","t4765", 
			"t4766","t4767","t4768","t4769"};

	int nmax = sizeof(keys) / sizeof(keys[0]);
	cout << nmax << "\n";

	map <string,Unit> dict_aa
		= mcached_to_dict_proc (server,port,nmax,keys);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

