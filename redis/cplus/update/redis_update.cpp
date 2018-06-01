// --------------------------------------------------------------------
/*
	redis_update.cpp

					Jun/01/2018

*/
// --------------------------------------------------------------------
#include	<iostream>

#include	<boost/algorithm/string.hpp>

using namespace std;
// --------------------------------------------------------------------
extern int socket_get_proc (const char host[],int port);
extern void socket_write_proc (int sock,const char str_command[]);
extern string redis_socket_receive_proc (int sock);
extern string json_update_proc (string json_str,int population_in);
extern void redis_socket_write_proc (int sock,string key,string json_str);
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];

	strcpy (key_in,argv[1]);

	int population_in = atoi (argv[2]);

	cout << key_in << endl;
	cout << population_in << endl;

	const string host = "127.0.0.1";
	const int port = 6379;

	int sock = socket_get_proc (host.c_str(),port);

	if (0 <= sock)
		{
		char str_command[255];
		sprintf (str_command,"get %s\r\n",key_in);

		socket_write_proc (sock,str_command);

		string json_str = redis_socket_receive_proc (sock);

		cout << json_str << '\n';

		if (0 < json_str.size ())
			{
			string json_str_new = json_update_proc (json_str,population_in);

			cout << json_str_new << "\n";

			redis_socket_write_proc (sock,key_in,json_str_new);
			}
		}

	close(sock);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------

