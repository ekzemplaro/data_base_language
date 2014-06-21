// --------------------------------------------------------------------
/*
	postgre_update.cpp

				Oct/29/2013


*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<cstring>

using namespace std;

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "postgres.h"
#include "libpq-fe.h"

// --------------------------------------------------------------------
extern string get_current_date_proc ();

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char id_in[10];
	strcpy (id_in,argv[1]);
	int population_in = atoi (argv[2]);

	cout << id_in << endl;
	cout << population_in << endl;

	char dbName[255] = "city";
	char login[255] = "scott";
	char pwd[255] = "tiger";
	char str_sql[255];
	PGconn *con;
	PGresult *res;

	string str_today = get_current_date_proc ();
	cout << str_today << endl;

	const char *today = str_today.c_str ();

	con = PQsetdbLogin("localhost",NULL,NULL,NULL,dbName,login,pwd);

	if ( PQstatus(con) == CONNECTION_BAD )
		{
		fprintf (stderr,"Connection to database '%s' failed.\n",dbName);
		fprintf (stderr,"%s",PQerrorMessage(con));
		exit(1);
		}

	sprintf (str_sql,
	"update cities set POPULATION = %d, DATE_MOD='%s' where ID = '%s'" ,
		population_in,today,id_in);

	cout << str_sql << "\n";

	res = PQexec (con,str_sql);

	PQclear(res);

	cerr << "*** 終了 ***\n";

	return 0;

}

// --------------------------------------------------------------------
