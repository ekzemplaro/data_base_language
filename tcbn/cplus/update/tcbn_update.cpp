// --------------------------------------------------------------------
/*
	tcbn_update.cpp

					Dec/27/2011

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<cstring>

#include	<tcbdb.h>

using namespace std;
// --------------------------------------------------------------------
extern void tcbn_display_proc (TCBDB *bdb);
extern void tcbn_update_proc
	(TCBDB *bdb,const char id_in[],const int population_in);

// --------------------------------------------------------------------
int main(int argc, char *argv[])
{
	char file_in[160];
	char id_in[10];
	int	population_in;

	TCBDB *bdb;
	int ecode;

	cerr << "*** 開始 ***\n";

	strcpy (file_in,argv[1]);
	strcpy (id_in,argv[2]);
	population_in = atoi (argv[3]);

	cerr << file_in;
	cerr << '\t' << id_in << '\t';
	cerr << population_in << '\n';

	bdb = tcbdbnew();

	if(!tcbdbopen(bdb, file_in, BDBOWRITER | BDBOCREAT))
		{
		ecode = tcbdbecode(bdb);
		fprintf(stderr, "open error: %s\n", tcbdberrmsg(ecode));
		}

	tcbn_update_proc (bdb,id_in,population_in);

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
