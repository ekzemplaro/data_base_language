// --------------------------------------------------------------------
/*
	mcached_update.cpp

					Jun/01/2018

*/
// --------------------------------------------------------------------
#include	<iostream>

#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern int socket_get_proc (const char host[],int port);
extern void socket_write_proc (int sock,const char str_command[]);
extern string socket_receive_proc (int sock);
extern string json_update_proc (string json_str,int population_in);
extern void mcached_socket_write_proc (int sock,string key,string json_str);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	string key_in = argv[1];

	int population_in = atoi (argv[2]);

	cout << key_in << endl;
	cout << population_in << endl;


	const string host = "127.0.0.1";
	const int port = 11211;

	int sock = socket_get_proc (host.c_str(),port);

	if (0<= sock)
		{
		cerr << "*** check fff ***\n";
		char str_command[255];
		sprintf (str_command,"get %s\r\n",key_in.c_str());

		cerr << str_command << '\n';

		cerr << "*** check ggg ***\n";
		socket_write_proc (sock,str_command);
		cerr << "*** check hhh ***\n";
		string json_str = socket_receive_proc (sock);
		cerr << "*** check iii ***\n";

		cerr << json_str << '\n';

		if (0 < json_str.size ())
			{
			string json_str_new = json_update_proc
				 (json_str,population_in);

			cerr << json_str_new << '\n';

			mcached_socket_write_proc (sock,key_in,json_str_new);
			}

		}


	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

