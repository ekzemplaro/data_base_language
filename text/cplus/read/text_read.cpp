// --------------------------------------------------------------------
/*
	text_read.cpp

				Feb/11/2018

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<cstring>
#include	<map>

using namespace std;
// --------------------------------------------------------------------
typedef map<string,string> Unit;
extern map <string,Unit> text_read_proc (char file_in[]);
extern	void dict_display_proc (map <string,Unit> dict_aa);

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	char file_in[160];

	strcpy (file_in,argv[1]);

//	cerr << "\tfile_in = " << file_in << "\n";

	map<string,Unit> dict_aa = text_read_proc (file_in);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
