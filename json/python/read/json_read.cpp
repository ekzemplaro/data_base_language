// -----------------------------------------------------------------------
/*
	json_read.cpp

					May/28/2018
*/
// -----------------------------------------------------------------------
#include	<iostream>
#include	<fstream>
#include	<string>
#include	<cstring>
#include	<map>

#include "json11.hpp"
// -----------------------------------------------------------------------
using namespace std;
using namespace json11;

typedef	map<string,string> Unit;

extern	void dict_display_proc (map <string,Unit> dict_aa);
extern	string file_to_str_proc (char file_in[]);
// -----------------------------------------------------------------------
map <string,Unit> json_to_dict_proc (string str_json)
{
	map <string,Unit> dict_aa;

	string err;
	auto json = Json::parse(str_json, err);

	if (!err.empty())
		{
		printf("Failed: %s\n", err.c_str());
		}
	else
		{
//		printf("Result: %s\n", json.dump().c_str());

		for (auto &kk : json.object_items())
			{
			string key = kk.first.c_str();
//			cout << key << "\t";
//			cout << kk.second.dump().c_str() << "\n";
			Unit unit_aa;
			for (auto &ll : kk.second.object_items())
				{
				string key_item = ll.first.c_str();
				unit_aa[key_item] = ll.second.dump().c_str();

//				cout << ll.first.c_str() << "\t";
//				cout << ll.second.dump().c_str() << "\t";
				}
			dict_aa[key] = unit_aa;
//			cout << "\n";
			}
		}

	return	dict_aa;
}

// -----------------------------------------------------------------------
int main (int argc, char* argv[])
{
	cerr << "*** 開始 ***\n";

	char file_in[160];

	strcpy (file_in,argv[1]);

	string str_json = file_to_str_proc (file_in);

	map <string,Unit> dict_aa = json_to_dict_proc (str_json);

	dict_display_proc (dict_aa);

	cerr << "*** 終了 ***\n";

	return 0;
}

// -----------------------------------------------------------------------
