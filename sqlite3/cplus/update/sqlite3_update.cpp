// --------------------------------------------------------------------
/*
	sqlite3_update.cpp

				May/30/2011

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<string>
#include	<cstring>

using namespace std;

#include	<stdio.h>
#include	<stdlib.h>
#include	<sqlite3.h>

// --------------------------------------------------------------------
extern string get_current_date_proc ();

// --------------------------------------------------------------------
static int callback (void *NotUsed, int argc, char *argv[],char *azColName[])
{
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

	string id_in = argv[2];
	int population_in = atoi (argv[3]);

	cout << id_in << endl;
	cout << population_in << endl;

	rc = sqlite3_open (file_in, &db);

	if( rc ){
		fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
		sqlite3_close(db);

		exit(1);
		}

	string str_today = get_current_date_proc ();
	cout << str_today << endl;

	const char *today = str_today.c_str ();

	char str_sql[200];
	sprintf (str_sql,
	"update cities set POPULATION = %d, DATE_MOD='%s' where ID = '%s'" ,
		population_in,today,id_in.c_str ());
	cout << str_sql << "\n";

	rc = sqlite3_exec (db,str_sql, callback, 0, &zErrMsg);

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
