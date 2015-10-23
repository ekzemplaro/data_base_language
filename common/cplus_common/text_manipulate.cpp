// --------------------------------------------------------------------
/*
	text_manipulate.cpp

					Feb/28/2012

*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<string>
#include	<cstring>
#include	<cstdlib>
#include	<ctime>
#include	<map>

#include	<boost/lexical_cast.hpp>
#include	<boost/tokenizer.hpp>

using namespace std;
using namespace boost;

// --------------------------------------------------------------------
typedef map<string,string> Unit;

// --------------------------------------------------------------------
void dict_display_proc (map <string,Unit> dict_aa)
{
	map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		Unit unit_aa = (*it).second;

		cout << (*it).first << "\t";
		cout << unit_aa["name"] << "\t";
		cout << unit_aa["population"] << "\t";
		cout << unit_aa["date_mod"] << endl;

		it++;
		}
}

// --------------------------------------------------------------------
map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod)
{
	Unit unit_aa;

	unit_aa["name"] = name;
	unit_aa["population"] = lexical_cast<string>(population);

	unit_aa["date_mod"] = date_mod;

	string key = lexical_cast<string>(id);

	dict_aa[key] = unit_aa;

	return dict_aa;
}

// --------------------------------------------------------------------
void text_write_proc_exec (char file_out[],map <string,Unit> dict_aa,
	const char delimit)
{
	ofstream fp_out (file_out);

	map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		Unit unit_aa = (*it).second;

		fp_out << (*it).first << delimit;
		fp_out << unit_aa["name"] << delimit;
		fp_out << unit_aa["population"] << delimit;
		fp_out << unit_aa["date_mod"] << endl;

		it++;
		}

	fp_out.close ();
}

// --------------------------------------------------------------------
void text_write_proc (char file_out[],map <string,Unit> dict_aa)
{
	const char delimit = '\t';

	text_write_proc_exec (file_out,dict_aa,delimit);
}

// --------------------------------------------------------------------
map <string,Unit> text_read_proc_exec (char file_in[],const char* format)
{
	map <string,Unit> dict_aa;

	Unit unit_aa;
	char line[160];

	char id[10];
	char name[80];
	int population;
	char date_mod[80];

	ifstream fp_in (file_in);

	while (!fp_in.eof ())
		{ 
		fp_in.getline (line,150);

		sscanf (line,format,&id,name,&population,date_mod);
	
		dict_aa = dict_append_proc (dict_aa,id,name,population,date_mod);	
		}

	fp_in.close ();

	return	dict_aa;
}

// --------------------------------------------------------------------
map <string,Unit> text_read_proc (char file_in[])
{
	const char* format = "%s%s%d%s";

	map <string,Unit> dict_aa = text_read_proc_exec (file_in,format);

	return	dict_aa;
}

// --------------------------------------------------------------------
string get_current_date_proc ()
{
	string str_out;

	struct tm *date;
	time_t now;

	time (&now);
	date = localtime (&now);

	int year = date-> tm_year + 1900;
	int month = date-> tm_mon + 1;
	int day = date-> tm_mday;

	str_out = lexical_cast<string>(year);
	str_out += "-";
	str_out += lexical_cast<string>(month);
	str_out += "-";
	str_out += lexical_cast<string>(day);

	return str_out;
}

// --------------------------------------------------------------------
map <string,Unit> dict_update_proc
	(map <string,Unit> dict_aa,char id_in[],int population_in)
{
//	cout << id_in << endl;
//	cout << population_in << endl;
	string today = get_current_date_proc ();
//	cout << today << endl;

	string key = lexical_cast<string>(id_in);

	if (dict_aa.find (key) != dict_aa.end ())
	{
	Unit unit_aa = dict_aa[key];

	unit_aa["population"] = lexical_cast<string>(population_in);
	unit_aa["date_mod"] = today;

	dict_aa[key] = unit_aa;
	}

	return	dict_aa;
}

// --------------------------------------------------------------------
void csv_write_proc (char file_out[],map <string,Unit> dict_aa)
{
	const char delimit = ',';

	text_write_proc_exec (file_out,dict_aa,delimit);
}

// --------------------------------------------------------------------
map <string,Unit> csv_line_parser (map <string,Unit> dict_aa,char line[])
{
	typedef boost::escaped_list_separator<char>	TokenSep;
	typedef boost::tokenizer< TokenSep > Tokenizer;

	TokenSep sep (0,',');

	string line_st = lexical_cast<string>(line);
	Tokenizer tok( line_st, sep );

	string str_array[20];

	int icount = 0;

	for( Tokenizer::iterator beg=tok.begin(); beg!=tok.end();++beg)
		{
		str_array[icount++] = *beg;
		}
/*
		cout << str_array[0] << "\t";
		cout << str_array[1] << "\t";
		cout << str_array[2] << "\t";
		cout << str_array[3];
		cout << endl;
*/
		string id = str_array[0];
		string name = str_array[1];
		int population = atoi (str_array[2].c_str ());
		string date_mod = str_array[3];

	dict_aa = dict_append_proc
		(dict_aa,id,name,population,date_mod);

	return	dict_aa;
}

// --------------------------------------------------------------------
map <string,Unit> csv_read_proc (char file_in[])
{
	map <string,Unit> dict_aa;

	char line[160];

	ifstream fp_in (file_in);

	while (!fp_in.eof ())
		{ 
		fp_in.getline (line,150);

		if (0 < strlen (line))
			{	
			dict_aa = csv_line_parser (dict_aa,line);
			}
		}

	fp_in.close ();

	return	dict_aa;
}

// --------------------------------------------------------------------
