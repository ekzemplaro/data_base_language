// ----------------------------------------------------------
/*
	file_io.cpp

				May/28/2018

*/
// ----------------------------------------------------------
#include	<string>
#include	<cstring>
#include	<iostream>
#include	<fstream>

using namespace std;

// ----------------------------------------------------------
string file_to_str_proc (char file_in[])
{
	string chunk = "";

	ifstream ifs (file_in);
	string buf;

	while (ifs && getline (ifs,buf))
		{
		chunk += buf;
		}


// cerr << "*** ppp ***\n";

	return	chunk;
}

// ----------------------------------------------------------
void file_write_proc (char file_out[], string str_out)
{
	ofstream fp_out (file_out);
	fp_out << str_out;
	fp_out.close ();

}

// ----------------------------------------------------------
