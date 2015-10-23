// --------------------------------------------------------------------
/*
	sqlite3_create.cpp

					Oct/21/2014

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<map>

#include	<string.h>
#include	<boost/lexical_cast.hpp>

#include	<sqlite3.h>

using namespace std;
using namespace boost;

typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

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
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t0711","郡山",34795,"1986-10-07");

	dict_aa = dict_append_proc (dict_aa,"t0712","会津若松",15982,"1986-2-12");
	dict_aa = dict_append_proc (dict_aa,"t0713","白河",73421,"1986-3-28");
	dict_aa = dict_append_proc (dict_aa,"t0714","福島",63519,"1986-2-21");

	dict_aa = dict_append_proc (dict_aa,"t0715","喜多方",83971,"1986-1-5");
	dict_aa = dict_append_proc (dict_aa,"t0716","二本松",73149,"1986-5-22");
	dict_aa = dict_append_proc (dict_aa,"t0717","いわき",46785,"1986-7-17");
	dict_aa = dict_append_proc (dict_aa,"t0718","相馬",54618,"1986-3-04");
	dict_aa = dict_append_proc (dict_aa,"t0719","須賀川",74823,"1986-5-9");

	return	dict_aa;
}

// --------------------------------------------------------------------
void table_insert_proc (sqlite3 *db,map <string,Unit> dict_aa)
{
	char *zErrMsg = 0;
	map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		Unit unit_aa = (*it).second;

		string id =  (*it).first;
		string name = unit_aa["name"];
		string population = unit_aa["population"];
		string date_mod = unit_aa["date_mod"];

		char str_sql[200];
	sprintf (str_sql,
"insert into cities (id,name,population,date_mod) values ('%s','%s',%s,'%s')" ,
	id.c_str (),name.c_str (),population.c_str (),date_mod.c_str ());

//	cout << str_sql << "\n";

	int rc = sqlite3_exec (db,str_sql, callback, 0, &zErrMsg);
		it++;
		}
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char file_sqlite3[160];

	strcpy (file_sqlite3,argv[1]);

	cerr << "\tfile_sqlite3 = " << file_sqlite3 << "\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;

	dict_display_proc (dict_aa);

	sqlite3 *db;
	char *zErrMsg = 0;

	int rc;

	rc = sqlite3_open (file_sqlite3, &db);

	if (rc)
		{
		fprintf (stderr,"Can't open database: %s\n",sqlite3_errmsg(db));
		sqlite3_close(db);

		exit (1);
		}

	rc = sqlite3_exec (db,"drop table cities", callback, 0, &zErrMsg);

	if( rc!=SQLITE_OK )
		{
		fprintf(stderr, "SQL error: %s\n", zErrMsg);
		sqlite3_free(zErrMsg);
		}

	string sql_str = "create table cities (id varchar(10), name varchar(20), population int, date_mod date)";

	rc = sqlite3_exec (db,sql_str.c_str (), callback, 0, &zErrMsg);

	if( rc!=SQLITE_OK )
		{
		fprintf(stderr, "SQL error: %s\n", zErrMsg);
		sqlite3_free(zErrMsg);
		}

	table_insert_proc (db,dict_aa);

	sqlite3_close(db);

	cerr << "\n*** 終了 ***\n";
}

// --------------------------------------------------------------------
