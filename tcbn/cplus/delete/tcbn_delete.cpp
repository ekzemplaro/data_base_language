// --------------------------------------------------------------------
/*
	tcbn_delete.cpp

					Dec/27/2011

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<cstring>

#include	<tcbdb.h>

using namespace std;
// --------------------------------------------------------------------
extern void tcbn_display_proc (TCBDB *bdb);

// --------------------------------------------------------------------
int main(int argc, char *argv[])
{
	char file_in[160];
	char id_in[10];

	TCBDB *bdb;
	BDBCUR *cur;
	int ecode;
	char *key, *value;

	cerr << "*** 開始 ***\n";

	strcpy (file_in,argv[1]);
	strcpy (id_in,argv[2]);

	cerr << "\tfile_in = " << file_in;
	cerr << "\tid_in = " << id_in << "\n";

	bdb = tcbdbnew();

	if(!tcbdbopen(bdb, file_in, BDBOWRITER | BDBOCREAT))
		{
		ecode = tcbdbecode(bdb);
		fprintf(stderr, "open error: %s\n", tcbdberrmsg(ecode));
		}

	ecode = tcbdbout2(bdb,id_in);

	tcbn_display_proc (bdb);

	if(!tcbdbclose(bdb))
		{
		ecode = tcbdbecode(bdb);
		fprintf(stderr, "close error: %s\n", tcbdberrmsg(ecode));
		}

	tcbdbdel(bdb);

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
