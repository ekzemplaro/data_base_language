// --------------------------------------------------------------------
/*
	postgre_create.cpp

					May/12/2012

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<map>

#include	<string.h>
#include	<boost/lexical_cast.hpp>

#include "postgres.h"
#include "libpq-fe.h"

using namespace std;
using namespace boost;

typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);


// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t3461","広島",34795,"1986-10-07");

	dict_aa = dict_append_proc (dict_aa,"t3462","福山",17982,"1986-2-12");
	dict_aa = dict_append_proc (dict_aa,"t3463","東広島",23429,"1986-3-28");
	dict_aa = dict_append_proc (dict_aa,"t3464","呉",23715,"1986-2-21");

	dict_aa = dict_append_proc (dict_aa,"t3465","尾道",84971,"1986-1-5");
	dict_aa = dict_append_proc (dict_aa,"t3466","竹原",76948,"1986-5-22");
	dict_aa = dict_append_proc (dict_aa,"t3467","三次",46785,"1986-8-17");
	dict_aa = dict_append_proc (dict_aa,"t3468","大竹",52614,"1986-7-7");
	dict_aa = dict_append_proc (dict_aa,"t3469","府中",71823,"1986-4-9");

	return	dict_aa;
}

// --------------------------------------------------------------------
void table_insert_proc (PGconn *con,map <string,Unit> dict_aa)
{
	PGresult *res;
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

	res = PQexec (con,str_sql);


//	cout << str_sql << "\n";
	PQclear(res);

		it++;
		}
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;

	dict_display_proc (dict_aa);


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

	res = PQexec (con,"drop table cities");

	PQclear(res);

	string sql_str = "create table cities (id varchar(10), name varchar(20), population int, date_mod date)";

	res = PQexec (con,sql_str.c_str ());

	PQclear(res);

	table_insert_proc (con,dict_aa);

	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
