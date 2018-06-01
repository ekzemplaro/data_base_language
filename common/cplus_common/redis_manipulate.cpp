// --------------------------------------------------------------------
/*
	redis_manipulate.cpp

					Jun/01/2018

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>
#include	<vector>

#include	<sys/socket.h>
#include	<netdb.h>
#include	<boost/lexical_cast.hpp>
#include	<boost/algorithm/string.hpp>
#include <arpa/inet.h>

using namespace std;
using namespace boost;

typedef map<string,string> Unit;
#define PORT 6379
// --------------------------------------------------------------------
extern void socket_write_proc (int sock,const char str_command[]);
extern string unit_to_json_proc (Unit unit_aa);
// --------------------------------------------------------------------
// [6-4-4]:
string redis_received_data_parser
	(ssize_t bytes_recieved,char incoming_data_buffer[])
{
	string str_rvalue;

	vector<string> vv;
	boost::algorithm::split (vv,incoming_data_buffer,boost::is_any_of("\n"));

//	cerr << "*** redis_received_data_parser ***\n";

//	cout << vv[0] << endl;

	if (vv[0][1] == '-')
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
string redis_socket_receive_proc (int sock)
{
	ssize_t bytes_recieved;
	char incoming_data_buffer[1000];

	bytes_recieved = recv (sock,incoming_data_buffer,1000,0);
// If no data arrives, the program will just wait here until some data arrives.
	if (bytes_recieved == 0) cout << "host shut down." << endl;
	if (bytes_recieved == -1) cout << "recieve error!" << endl;

	string json_str = redis_received_data_parser
		(bytes_recieved,incoming_data_buffer);

	incoming_data_buffer[0] = '\0';

	return	json_str;
}

// --------------------------------------------------------------------
// [6-8]:
void redis_socket_write_proc (int sock,string key,string json_str)
{
	const char *key_in = key.c_str ();

	int ll_key = strlen (key.c_str ());
	int llx = strlen (json_str.c_str ());

//	cerr << "llx = " << llx <<  endl;

	char *com_aa = (char*)"*3\r\n";
	socket_write_proc (sock,com_aa);

	char *com_bb = (char*)"$3\r\n";
	socket_write_proc (sock,com_bb);

	char *com_cc = (char*)"set\r\n";
	socket_write_proc (sock,com_cc);

	char str_command_aa[255];
	sprintf (str_command_aa,"$%d\r\n",ll_key);
	socket_write_proc (sock,str_command_aa);

	char str_command_bb[255];
	sprintf (str_command_bb,"%s\r\n",key.c_str ());
	socket_write_proc (sock,str_command_bb);

	char str_command_cc[255];
	sprintf (str_command_cc,"$%d\r\n",llx);
	socket_write_proc (sock,str_command_cc);

	char str_command_dd[255];
	sprintf (str_command_dd,"%s\r\n",json_str.c_str ());
	socket_write_proc (sock,str_command_dd);

	ssize_t bytes_recieved;
	char incoming_data_buffer[1000];

	bytes_recieved = recv (sock,incoming_data_buffer,1000,0);

	if (bytes_recieved == 0) cout << "host shut down." << endl;
	if (bytes_recieved == -1) cout << "recieve error!" << endl;

}

// -----------------------------------------------------------------
// [6]:
void dict_to_redis_proc (int sock,map <string,Unit> dict_aa)
{
	cerr << "*** dict_to_redis_proc *** start ***\n";

	map <string,Unit>:: iterator itr = dict_aa.begin ();

	while (itr != dict_aa.end ())
		{
		string key_in = (*itr).first;
		Unit unit_aa = (*itr).second;

		string json_str = unit_to_json_proc (unit_aa);
		cerr << "key_in = " << key_in << '\n';
		cerr << json_str << '\n';

		redis_socket_write_proc (sock,key_in,json_str);
		itr++;
		}

	cerr << "*** dict_to_redis_proc *** end ***\n";
}

// --------------------------------------------------------------------
