// --------------------------------------------------------------------
/*
	maria_update.cpp

				Apr/08/2017


*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<cstring>

using namespace std;

#include <stdlib.h>
#include <stdio.h>
#include <mysql.h>

#define MYSQL_SERVER "localhost"
#define MYSQL_USERNAME "scott"
#define MYSQL_PASSWORD "tiger123"
#define MYSQL_DB "city"
#define MYSQL_SOCKET "/var/run/mysqld/mysqld.sock"
#define MYSQL_OPT 0
// --------------------------------------------------------------------
extern string get_current_date_proc ();

// --------------------------------------------------------------------
int main (int argc, char *argv[])
{
	cerr << "*** 開始 ***\n";

	char key_in[10];

	strcpy (key_in,argv[1]);

	int population_in = atoi (argv[2]);

	cout << key_in << endl;
	cout << population_in << endl;


	int count;
	MYSQL mysql_buf;
	MYSQL *mysql=0;
	MYSQL_RES *result;
	MYSQL_ROW record;

	string str_today = get_current_date_proc ();
	cout << str_today << endl;

	const char *today = str_today.c_str ();

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

	char str_sql[255];

	sprintf (str_sql,
	"update cities set POPULATION = %d, DATE_MOD='%s' where ID = '%s'" ,
		population_in,today,key_in);
	cout << str_sql << "\n";

	mysql_query (&mysql_buf, str_sql);
	result = mysql_store_result (&mysql_buf);

	mysql_close(&mysql_buf);

	mysql_free_result(result);

	cerr << "*** 終了 ***\n";

	return 0;

}

// --------------------------------------------------------------------
