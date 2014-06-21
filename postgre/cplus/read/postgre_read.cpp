// --------------------------------------------------------------------
/*
	postgre_read.cpp

					May/22/2012


*/
// --------------------------------------------------------------------
#include	<iostream>

using namespace std;

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "postgres.h"
#include "libpq-fe.h"

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char dbName[255] = "city";
	char login[255] = "scott";
	char pwd[255] = "tiger";
	char sql[255];
	PGconn *con;
	PGresult *res;

	con = PQsetdbLogin("localhost",NULL,NULL,NULL,dbName,login,pwd);

	if ( PQstatus(con) == CONNECTION_BAD )
		{
		fprintf (stderr,"Connection to database '%s' failed.\n",dbName);
		fprintf (stderr,"%s",PQerrorMessage(con));
		exit(1);
		}

	sprintf (sql,"select * from cities");

	res = PQexec (con,sql);

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
		{
		fprintf (stderr,"%s",PQerrorMessage(con));
		exit (1);
		}

	int nn_tuples = PQntuples (res);
	cout << "nn_tuples = " << nn_tuples << "\n";

	int nn_fields = PQnfields (res);
	cout << "nn_fields = " << nn_fields << "\n";

	for (int it = 0; it < nn_tuples ;it++)
		{
		for (int jt=0; jt< nn_fields; jt++)
			{
			if (0 < jt)
				{
				cout << "\t";
				}

			string vv = PQgetvalue (res,it,jt);
			cout << vv;
			}
		cout << "\n";
		}

	PQclear(res);

	cerr << "*** 終了 ***\n";

	return 0;

}

// --------------------------------------------------------------------
