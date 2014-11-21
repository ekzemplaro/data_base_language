// --------------------------------------------------------------------
/*
	maria_create.cpp

					Nov/19/2014

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<map>

#include	<string.h>
#include	<boost/lexical_cast.hpp>
#include	<mysql.h>


using namespace std;
using namespace boost;

typedef map<string,string> Unit;

#define MYSQL_SERVER "localhost"
#define MYSQL_USERNAME "scott"
#define MYSQL_PASSWORD "tiger"
#define MYSQL_DB "city"
#define MYSQL_SOCKET "/var/run/mysqld/mysqld.sock"
#define MYSQL_OPT 0

// --------------------------------------------------------------------
extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);


// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t3321","岡山",341795,"1922-5-12");

	dict_aa = dict_append_proc (dict_aa,"t3322","倉敷",135982,"1922-8-15");
	dict_aa = dict_append_proc (dict_aa,"t3323","津山",236479,"1922-9-26");
	dict_aa = dict_append_proc (dict_aa,"t3324","玉野",235814,"1922-4-24");

	dict_aa = dict_append_proc (dict_aa,"t3325","笠岡",834971,"1922-11-5");
	dict_aa = dict_append_proc (dict_aa,"t3326","井原",731949,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t3327","総社",462785,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t3328","高梁",549617,"1922-3-7");
	dict_aa = dict_append_proc (dict_aa,"t3329","新見",742863,"1922-5-9");

	return	dict_aa;
}

// --------------------------------------------------------------------
void table_insert_proc (MYSQL *amysql_buf,map <string,Unit> dict_aa)
{
	MYSQL_RES *result;
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

	mysql_query (amysql_buf, str_sql);
	result = mysql_store_result (amysql_buf);
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

	mysql_query (&mysql_buf, "drop table cities");
	result = mysql_store_result (&mysql_buf);

	string sql_str = "create table cities (id varchar(10), name varchar(20), population int, date_mod date)";
	mysql_query (&mysql_buf, sql_str.c_str ());
	result = mysql_store_result (&mysql_buf);

	table_insert_proc (&mysql_buf,dict_aa);

	mysql_close(&mysql_buf);
	mysql_free_result(result);

	cerr << "\n*** 終了 ***\n";
}

// --------------------------------------------------------------------
