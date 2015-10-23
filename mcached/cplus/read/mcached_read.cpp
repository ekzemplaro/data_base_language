// --------------------------------------------------------------------
/*
	mcached_read.cpp

				Feb/10/2015

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>

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

	string keys[] = {"t1731","t1732","t1733","t1734","t1735", 
			"t1736","t1737","t1738","t1739"};
	int nmax = sizeof(keys) / sizeof(keys[0]);
	cout << nmax << "\n";

	char server[] = "localhost";
	int port = 11211;

	map <string,Unit> dict_aa
		= mcached_to_dict_proc (server,port,nmax,keys);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

