// --------------------------------------------------------------------
/*
	riak_create.cpp

				Sep/22/2015
*/
// --------------------------------------------------------------------
#include	<iostream>
#include	<map>

#include	<boost/lexical_cast.hpp>

using namespace std;
using namespace boost;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);

extern void curl_put_proc (const char *url_target,string str_in);
extern string unit_to_json_proc (Unit unit_aa);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t3251","松江",38297,"1922-8-5");

	dict_aa = dict_append_proc (dict_aa,"t3252","出雲",98735,"1922-10-21");
	dict_aa = dict_append_proc (dict_aa,"t3253","大田",23618,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t3254","雲南",51986,"1922-7-25");

	dict_aa = dict_append_proc (dict_aa,"t3255","江津",83971,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t3256","浜田",74938,"1922-5-12");
	dict_aa = dict_append_proc (dict_aa,"t3257","益田",46715,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t3258","安来",51624,"1922-3-04");

	return	dict_aa;
}
// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	const string url_shimane = "http://host_ubuntu:8098/riak/shimane";

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;


map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		string key_in = (*it).first;
		Unit unit_aa = (*it).second;

		string json_str = unit_to_json_proc (unit_aa);
		cout << json_str << '\n';

		string url_aa = url_shimane + "/" + key_in;
		curl_put_proc (url_aa.c_str (),json_str);

		it++;
		}

	cerr << "*** 終了 ***\n";
}

// --------------------------------------------------------------------
