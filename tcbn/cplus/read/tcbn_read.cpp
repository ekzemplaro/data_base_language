// --------------------------------------------------------------------
/*
	tcbn_read.cpp

					Dec/13/2013

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

	TCBDB *bdb;
	int ecode;

	cerr << "*** 開始 ***\n";

	strcpy (file_in,argv[1]);

//	cerr << "\tfile_in = " << file_in << "\n";

	bdb = tcbdbnew();

	if(!tcbdbopen(bdb, file_in, BDBOWRITER | BDBOCREAT))
		{
		ecode = tcbdbecode(bdb);
		fprintf(stderr, "open error: %s\n", tcbdberrmsg(ecode));
		}

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
