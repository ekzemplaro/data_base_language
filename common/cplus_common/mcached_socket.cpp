// --------------------------------------------------------------------
/*
	mcached_socket.cpp

					Jun/01/2018

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<vector>
#include	<map>

#include	<sys/socket.h>
#include	<netdb.h>
#include	<boost/lexical_cast.hpp>
#include	<boost/algorithm/string.hpp>

using namespace std;
using namespace boost;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern string json_update_proc (string json_str,int population_in);
extern string unit_to_json_proc (Unit unit_aa);
extern Unit json_to_unit_proc (string json_str);
extern void socket_write_proc (int sock,const char str_command[]);

// --------------------------------------------------------------------
int socket_connect_proc (int sock,addrinfo *addrs)
{
	int rvalue = connect (sock, addrs->ai_addr, addrs->ai_addrlen);

	return	rvalue;
}

// --------------------------------------------------------------------
// [6-4-4]:
string received_data_parser
	(ssize_t bytes_recieved,char incoming_data_buffer[])
{
	string str_rvalue;

	vector<string> vv;
	boost::algorithm::split (vv,incoming_data_buffer,boost::is_any_of("\n"));

	if (vv[0][0] == 'E')
		{
		str_rvalue = "";
		}
	else
		{
		str_rvalue = vv[1];
		}

	return	str_rvalue;
}

// --------------------------------------------------------------------
// [6-4]:
string socket_receive_proc (int sock)
{
	ssize_t bytes_recieved;
	char incoming_data_buffer[1000];

	bytes_recieved = recv (sock,incoming_data_buffer,1000,0);
// If no data arrives, the program will just wait here until some data arrives.
	if (bytes_recieved == 0) cout << "host shut down." << endl;
	if (bytes_recieved == -1) cout << "recieve error!" << endl;

	string json_str = received_data_parser
		(bytes_recieved,incoming_data_buffer);

	incoming_data_buffer[0] = '\0';

	return	json_str;
}

// --------------------------------------------------------------------
// [6]:
string socket_read_proc (string key_str,addrinfo *addrs)
{
	const char *key_in = key_str.c_str ();

	string json_str = "";

	char str_command[255];
	sprintf (str_command,"get %s\r\n",key_in);

	int sock = socket(addrs->ai_family,
		addrs->ai_socktype, addrs->ai_protocol);

	if (0 <= sock)
		{
		if (0 <= socket_connect_proc (sock,addrs))
			{
			socket_write_proc (sock,str_command);

			json_str = socket_receive_proc (sock);
			}

		close(sock);
		}

	return	json_str;
}

// --------------------------------------------------------------------
// [8-8]:
void mcached_socket_write_proc (int sock,string key,string json_str)
{
	const char *key_in = key.c_str ();

	int llx = strlen (json_str.c_str ());

	char str_command[255];
	sprintf (str_command,"set %s 0 0 %d\r\n",key_in,llx);

	socket_write_proc (sock,str_command);

	const char *ch_json = json_str.c_str ();
	socket_write_proc (sock,ch_json);

	char *tail = (char*)"\r\n";

	socket_write_proc (sock,tail);

	ssize_t bytes_recieved;
	char incoming_data_buffer[1000];

	bytes_recieved = recv (sock,incoming_data_buffer,1000,0);

	if (bytes_recieved == 0) cout << "host shut down." << endl;
	if (bytes_recieved == -1) cout << "recieve error!" << endl;
}

// --------------------------------------------------------------------
int dict_to_mcached_exec_proc (int sock,map <string,Unit> dict_aa)
{
	map <string,Unit>:: iterator itr = dict_aa.begin ();

	while (itr != dict_aa.end ())
		{
		string key_in = (*itr).first;
		Unit unit_aa = (*itr).second;

		string json_str = unit_to_json_proc (unit_aa);
		cout << json_str << '\n';

		mcached_socket_write_proc (sock,key_in,json_str);
		itr++;
		}

	return	0;
}

// --------------------------------------------------------------------
