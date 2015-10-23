// ------------------------------------------------------------------
/*
	berkeley_read.cpp

					Mar/06/2014

*/
// ------------------------------------------------------------------
#include	<iostream>
#include	<fstream>

#include	<sys/types.h>
#include	<stdio.h>
#include	<stdlib.h>
#include	<cstring>
#include	<string>
#include	<db.h>

using namespace std;

extern void json_record_display (string key_in,string json_str);
int db_cursor_read_proc (DB *dbp,const char file_db[]);
// ------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char file_db[160];

	strcpy (file_db,argv[1]);

	cerr << "\tfile_db = " << file_db << endl;

	char key_in[10];
	strcpy (key_in,argv[2]);

	cerr << key_in << endl;

	DB *dbp = NULL;
	int ret;
	int t_ret;

	DBT key;
	memset(&key, 0, sizeof(key));
	key.data = &key_in;
	key.size = sizeof(key_in);

	ret = db_create(&dbp, NULL, 0);
	if (ret != 0)
		{
	        fprintf(stderr, "db_create: %s\n", db_strerror(ret));
		}
	else
		{

//	ret = dbp->open(dbp, NULL, file_db, NULL, DB_BTREE, DB_RDONLY, 0);
	ret = dbp->open(dbp, NULL, file_db, NULL, DB_BTREE, 0, 0);
	if (ret != 0) {
        dbp->err(dbp, ret, "%s", file_db);
	}
	else
		{
	ret = dbp->del (dbp, NULL,&key, 0);
    if (ret != 0) {
        dbp->err(dbp, ret, "%s", file_db);
    }
		db_cursor_read_proc (dbp,file_db);
		}

	}


    /* int DB->close(DB *db, u_int32_t flags);
     *
     * DB->close は、Berkeley DB ハンドルを閉じます。*/

	if (dbp) {
        t_ret = dbp->close(dbp, 0);
        if (t_ret != 0 && ret == 0)
		ret = t_ret;
	}

	cerr << "*** 終了 ***\n";

    exit (ret);
}

// ------------------------------------------------------------------
int db_cursor_read_proc (DB *dbp,const char file_db[])
{
	int ret;
	int t_ret;
	DBC *dbcp = NULL;
	DBT key;
	DBT data;

	ret = dbp->cursor(dbp, NULL, &dbcp, 0);
    if (ret != 0) {
        dbp->err(dbp, ret, "%s", file_db);
    }
else
{
	fprintf (stderr, "*** ccc ***\n");
	while (1) {
		memset(&key, 0, sizeof(key));
		memset(&data, 0, sizeof(data));

		ret = dbcp->c_get(dbcp, &key, &data, DB_NEXT);

	if (ret == DB_NOTFOUND) {
//	fprintf (stderr, "*** DB_NOTFOUND ***\n");
		ret = 0;
		break;
		}
	else if (ret != 0) {
		dbp->err(dbp, ret, "%s", file_db);
		break;
        }

//        printf("%.*s\t%.*s\n", (int)key.size, (char *)key.data,
//               (int)data.size, (char *)data.data);

	json_record_display ((char *)key.data,(char *)data.data);
    }
	fprintf (stderr, "*** fff ***\n");
}

	if (dbcp)
		{
		t_ret = dbcp->c_close(dbcp);
		if (t_ret != 0 && ret == 0)
		ret = t_ret;
		}

	return	ret;
}

// ------------------------------------------------------------------
