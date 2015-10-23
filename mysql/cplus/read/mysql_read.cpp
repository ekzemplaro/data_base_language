// --------------------------------------------------------------------
/*
	mysql_read.cpp

				Apr/18/2011


*/
// --------------------------------------------------------------------
#include	<iostream>

using namespace std;

#include <stdlib.h>
#include <stdio.h>
#include <mysql.h>

#define MYSQL_SERVER "host_mysql"
#define MYSQL_USERNAME "scott"
#define MYSQL_PASSWORD "tiger"
#define MYSQL_DB "city"
#define MYSQL_SOCKET "/var/run/mysqld/mysqld.sock"
#define MYSQL_OPT 0

int main (int argc, char *argv[])
{
	cerr << "*** 開始 ***\n";

	int count;
	MYSQL mysql_buf;
	MYSQL *mysql=0;
	MYSQL_RES *result;
	MYSQL_ROW record;

	mysql_init(&mysql_buf);


	mysql = mysql_real_connect (&mysql_buf,
		MYSQL_SERVER, MYSQL_USERNAME,
		MYSQL_PASSWORD, MYSQL_DB, MYSQL_PORT,
		MYSQL_SOCKET, MYSQL_OPT);


	if (!mysql)
	{
	cerr << "*** ffff ***\n";

	printf("failed to connect to mysql server (server=%s, userid=%s)\n",
		MYSQL_SERVER ? MYSQL_SERVER : "",
		MYSQL_USERNAME ? MYSQL_USERNAME : "");
		return (-1);
	}

	mysql_query (&mysql_buf, "SET NAMES utf8");
	result = mysql_store_result (&mysql_buf);

	mysql_query (&mysql_buf, "SELECT * FROM cities");
	result = mysql_store_result (&mysql_buf);

	long nn = mysql_num_rows (result);

	cout << "nn = " << nn << "\n";

	for(count = mysql_num_rows(result); count > 0; count--)
	{
	record = mysql_fetch_row(result);

	cout << record[0] << "\t";
	cout << record[1] << "\t";
	cout << record[2] << "\t";
	cout << record[3] << "\n";
	};

	mysql_close(&mysql_buf);

	mysql_free_result(result);

	cerr << "*** 終了 ***\n";

	return 0;

}

// --------------------------------------------------------------------
