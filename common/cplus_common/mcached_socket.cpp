// --------------------------------------------------------------------
/*
	mcached_socket.cpp

				Feb/10/2015

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

// --------------------------------------------------------------------
int socket_connect_proc (int sock,addrinfo *addrs)
{
	int rvalue = connect (sock, addrs->ai_addr, addrs->ai_addrlen);

	return	rvalue;
}

// --------------------------------------------------------------------
// [4]:
void socket_write_proc (int sock,const char str_command[])
{
	int	len;
	int	slen;

	const char *pm = str_command;

	do
		{
		len = strlen (pm);
		slen = send (sock,pm,len,0);
		pm += slen;
		}
		while ((0 <= slen) && (slen < len));
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
// [8]:
void socket_update_proc (char key_in[],int population_in,addrinfo *addrs)
{
	char str_command[255];
	sprintf (str_command,"get %s\r\n",key_in);

	cout << str_command << "\n";

	int sock = socket(addrs->ai_family,
		addrs->ai_socktype, addrs->ai_protocol);

	if (0 <= sock)
		{
		if (0 <= socket_connect_proc (sock,addrs))
			{
			socket_write_proc (sock,str_command);

			string json_str = socket_receive_proc (sock);


		if (0 < json_str.size ())
			{
			string json_str_new = json_update_proc
				(json_str,population_in);

			mcached_socket_write_proc (sock,key_in,json_str_new);
			}
			}
		close(sock);
		}
}

// --------------------------------------------------------------------
void mcached_update_proc
	(char server[],int port,char key_in[],int population_in)
{
	addrinfo hints;
	addrinfo *addrs;

	memset (&hints, 0, sizeof(addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	char str_port [20];

	sprintf (str_port,"%d",port);

	if (0 == getaddrinfo (server,str_port,&hints,&addrs))
		{
		socket_update_proc (key_in,population_in,addrs);

		freeaddrinfo(addrs);
		}
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
void dict_to_mcached_proc (char server[],int port,map <string,Unit> dict_aa)
{
	addrinfo hints;
	addrinfo *addrs;

	memset (&hints, 0, sizeof(addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	char str_port [20];

	sprintf (str_port,"%d",port);

	if (getaddrinfo (server,str_port,&hints,&addrs) == 0)
		{
		int sock = socket(addrs->ai_family,
		addrs->ai_socktype, addrs->ai_protocol);

		if (0 <= sock)
			{
			if (0 <= socket_connect_proc (sock,addrs))
				{
				dict_to_mcached_exec_proc (sock,dict_aa);
				}
			}

		close (sock);

		freeaddrinfo (addrs);
		}
}

// --------------------------------------------------------------------
map <string,Unit > mcached_to_dict_proc
	(char server[],int port,int nmax,string keys [])
{
	map <string,Unit> dict_aa;

	addrinfo hints;
	addrinfo *addrs;

	memset (&hints, 0, sizeof(addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	char str_port [20];

	sprintf (str_port,"%d",port);
 
	if (0 == getaddrinfo (server,str_port,&hints,&addrs))
		{
		for (int it=0; it < nmax; it++)
			{
			string key = keys[it];
			string json_str = socket_read_proc (key,addrs);
			if (0 < json_str.size ())
				{
				dict_aa[key] = json_to_unit_proc (json_str);
				}
			}

		freeaddrinfo(addrs);
		}

	return	dict_aa;
}

// --------------------------------------------------------------------
void mcached_delete_proc (char server[],int port,char key_in[])
{
	int	sock;
	char str_command[255];
	sprintf (str_command,"delete %s\r\n",key_in);

	addrinfo hints;
	addrinfo *addrs;  
	memset (&hints, 0, sizeof(addrinfo));
	hints.ai_family = AF_UNSPEC;
	hints.ai_socktype = SOCK_STREAM;

	char str_port [20];

	sprintf (str_port,"%d",port);
 
	if (0 == getaddrinfo (server,str_port,&hints,&addrs))
		{
		sock = socket(addrs->ai_family,
			addrs->ai_socktype, addrs->ai_protocol);
		if (0 <= sock)
			{
			if (0 <= socket_connect_proc (sock,addrs))
				{
				socket_write_proc (sock,str_command);
				}
			}

		close(sock);

		freeaddrinfo (addrs);
		}
}

// --------------------------------------------------------------------
