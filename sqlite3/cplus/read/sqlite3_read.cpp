// --------------------------------------------------------------------
/*
	sqlite3_read.cpp

				Jan/26/2011


*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<cstring>

using namespace std;

#include	<stdio.h>
#include	<stdlib.h>
#include	<sqlite3.h>

// --------------------------------------------------------------------
static int callback (void *NotUsed, int argc, char *argv[],char *azColName[])
{
	int it;

	for (it=0; it<argc; it++)
		{
		cout << argv[it] << "\t";
		}

	cout << "\n";

	return 0;
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	sqlite3 *db;
	char *zErrMsg = 0;
	int rc;

	char file_in[160];

	strcpy (file_in,argv[1]);

	rc = sqlite3_open (file_in, &db);

	if( rc ){
		fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
		sqlite3_close(db);

		exit(1);
		}

	rc = sqlite3_exec (db,"select * from cities", callback, 0, &zErrMsg);

	if( rc!=SQLITE_OK )
		{
		fprintf(stderr, "SQL error: %s\n", zErrMsg);
		sqlite3_free(zErrMsg);
		}

	sqlite3_close(db);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
