// --------------------------------------------------------------------
/*
	socket_manipulate.cpp

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
// --------------------------------------------------------------------
// extern string json_update_proc (string json_str,int population_in);
// extern string unit_to_json_proc (Unit unit_aa);
// extern void json_record_display (string key_in,string json_str);
// --------------------------------------------------------------------
int socket_get_proc (const char host[],int port)
{
	sockaddr_in address;
	sockaddr_in serv_addr;

	int sock = 0;

	char buffer[1024] = {0};
	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0)
		{
		printf("\n Socket creation error \n");
		return -1;
		}

	memset(&serv_addr, '0', sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_port = htons(port);

	if(inet_pton(AF_INET,host, &serv_addr.sin_addr)<=0) 
		{
		printf("\nInvalid address/ Address not supported \n");
		return -1;
		}

	printf("sock = %d\n",sock);
	printf("sizeof(serv_addr) = %ld\n",sizeof(serv_addr));

	if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
		{
		printf("\nConnection Failed \n");
		return -1;
		}

	return sock;
}

// --------------------------------------------------------------------
