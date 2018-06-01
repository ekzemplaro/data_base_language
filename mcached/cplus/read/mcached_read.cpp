// --------------------------------------------------------------------
/*
	mcached_read.cpp

					Jun/01/2018

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>
#include	<sys/socket.h>
#include	<netdb.h>
#include	<boost/lexical_cast.hpp>
#include	<boost/algorithm/string.hpp>
#include <arpa/inet.h>

using namespace std;

typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern Unit json_to_unit_proc (string json_str);
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern  map <string,Unit > mcached_to_dict_proc
	(char server[],int port,int nmax,string keys []);

extern void socket_write_proc (int sock,const char str_command[]);
extern string socket_receive_proc (int sock);
extern int socket_get_proc (const char host[],int port);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	string keys[] = {"t1731","t1732","t1733","t1734","t1735", 
			"t1736","t1737","t1738","t1739"};
	int nmax = sizeof(keys) / sizeof(keys[0]);
	cout << nmax << "\n";

	const string host = "127.0.0.1";
	const int port = 11211;

	int sock = socket_get_proc (host.c_str(),port);

	if (0<= sock)
		{
		cerr << "*** check bbb ***\n";

		for (int it=0; it < nmax; it++)
			{
		string key_in = keys[it];

		char str_command[255];
		sprintf (str_command,"get %s\r\n",key_in.c_str());
	
		socket_write_proc (sock,str_command);
		string json_str = socket_receive_proc (sock);

//		cout << json_str << '\n';

		Unit unit_aa = json_to_unit_proc (json_str);

	cout << key_in << "\t";
	cout << unit_aa["name"] << '\t';
	cout << unit_aa["population"] << '\t';
	cout << unit_aa["date_mod"] << '\n';

			}
		}

	close (sock);
/*
	map <string,Unit> dict_aa
		= mcached_to_dict_proc (server,port,nmax,keys);

	dict_display_proc (dict_aa);
*/

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

