// --------------------------------------------------------------------
/*
	tcbn_create.cpp

					Dec/27/2011

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<cstring>
#include	<map>

#include	<tcbdb.h>

using namespace std;

// --------------------------------------------------------------------
typedef map<string,string> Unit;

// --------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
// --------------------------------------------------------------------
extern void tcbn_display_proc (TCBDB *bdb);
extern void dict_to_tcbn_proc (map <string,Unit> dict_aa,TCBDB *bdb);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t0831","水戸",52673,"1922-11-7");

	dict_aa = dict_append_proc (dict_aa,"t0832","古河",98231,"1922-12-12");
	dict_aa = dict_append_proc (dict_aa,"t0833","結城",23429,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t0834","土浦",51486,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t0835","牛久",83971,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t0836","取手",74948,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t0837","つくば",46785,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t0838","日立",59614,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t0839","守谷",71823,"1922-5-9");

	return	dict_aa;
}

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

	cerr << file_in << '\n';

	map <string,Unit> dict_aa = data_prepare_proc ();

	bdb = tcbdbnew();

	if(!tcbdbopen(bdb, file_in, BDBOWRITER | BDBOCREAT))
		{
		ecode = tcbdbecode(bdb);
		fprintf(stderr, "open error: %s\n", tcbdberrmsg(ecode));
		}

	dict_to_tcbn_proc (dict_aa,bdb);

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
