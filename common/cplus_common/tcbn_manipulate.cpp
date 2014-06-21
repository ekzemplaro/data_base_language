// --------------------------------------------------------------------
/*
	tcbn_manipulate.cpp

					Dec/27/2011

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<cstring>
#include	<map>

#include	<tcbdb.h>

using namespace std;
// --------------------------------------------------------------------
extern void json_display_proc (string key_in,string str_json);
extern string json_update_proc (string str_json,int population);
extern string to_json_proc (string name,int population,string date_mod);

typedef map<string,string> Unit;
// --------------------------------------------------------------------
void tcbn_display_proc (TCBDB *bdb)
{
	BDBCUR *cur;
	char *key, *value;

	cur = tcbdbcurnew(bdb);
	tcbdbcurfirst(cur);
	while((key = tcbdbcurkey2(cur)) != NULL)
		{
		value = tcbdbcurval2(cur);
		if(value)
			{
//			printf("%s:%s\n", key, value);

			string str_key = key;
			string json_str = value;

			json_display_proc (str_key,json_str);

			free(value);
			}
		free(key);
		tcbdbcurnext(cur);
		}

	tcbdbcurdel(cur);
}

// --------------------------------------------------------------------
void tcbn_update_proc (TCBDB *bdb,const char id_in[],const int population_in)
{
	char *value;
	int ecode;

	value = tcbdbget2(bdb, id_in);

	if(value)
		{
		printf("%s\n", value);
		string json_str = value;
		string json_new = json_update_proc (json_str,population_in);

		cout << json_new << '\n';
		char char_json[160];
		ecode = tcbdbput2(bdb,id_in,json_new.c_str ());

		cout << "ecode = " << ecode << '\n';

		free(value);
		}
	else
		{
		ecode = tcbdbecode(bdb);
		fprintf(stderr, "get error: %s\n", tcbdberrmsg(ecode));
		}
}

// --------------------------------------------------------------------
void dict_to_tcbn_proc (map <string,Unit> dict_aa,TCBDB *bdb)
{
	int	ecode;

	map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		Unit unit_aa = (*it).second;

		string key = (*it).first;

		int population = atoi (unit_aa["population"].c_str ());

		string json_out = to_json_proc
			(unit_aa["name"],population,unit_aa["date_mod"]);

//		cout << json_out << '\n';

		ecode = tcbdbput2 (bdb,key.c_str (),json_out.c_str ());

		it++;
		}
}

// --------------------------------------------------------------------
