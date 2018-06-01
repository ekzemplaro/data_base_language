// --------------------------------------------------------------------
/*
	redis_read.cpp

					Jun/01/2018

*/
// --------------------------------------------------------------------
#include <iostream>
#include <boost/algorithm/string.hpp>

#include <arpa/inet.h>

using namespace std;
#define PORT 6379

typedef map<string,string> Unit;

extern Unit json_to_unit_proc (string json_str);
extern string redis_received_data_parser
	(ssize_t bytes_recieved,char incoming_data_buffer[]);
extern int socket_get_proc (const char host[],int port);
// --------------------------------------------------------------------
void redis_record_display (int sock,string key_in)
{
	char buffer[1024] = {0};

	const string str_aa = "get " + key_in +  "\r\n";
	const char *hello = str_aa.c_str();
	send(sock , hello , strlen(hello) , 0 );
	int valread = read( sock , buffer, 1024);

//	cout << valread << "\n";
	string json_str =  redis_received_data_parser (valread,buffer);
//	cout << json_str << "\n";

	Unit unit_aa = json_to_unit_proc (json_str);

	cout << key_in << "\t";
	cout << unit_aa["name"] << '\t';
	cout << unit_aa["population"] << '\t';
	cout << unit_aa["date_mod"] << '\n';
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	const string host = "127.0.0.1";
	const int port = 6379;

	int sock = socket_get_proc (host.c_str(),port);

	if (0 <= sock)
		{
	string keys[] = {"t1851","t1852","t1853","t1854","t1855", 
			"t1856","t1857","t1858","t1859"};
	const int nmax = 9;


	for (int it=0; it < nmax; it++)
		{
		const string key = keys[it];
//		cerr << "it = " << it << "\t";
//		cerr << "key = " << key << "\t";
//		printf("%s\n",buffer );
		redis_record_display (sock,key);
		}

		}

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
