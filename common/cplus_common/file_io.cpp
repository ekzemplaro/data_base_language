// ----------------------------------------------------------
/*
	file_io.cpp

				Feb/27/2012

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
