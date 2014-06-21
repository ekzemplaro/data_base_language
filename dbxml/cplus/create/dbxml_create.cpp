// --------------------------------------------------------------------
/*
	dbxml_create.cpp

					Feb/21/2012

*/
// --------------------------------------------------------------------
#include <iostream>
#include <map>
#include <dbxml/DbXml.hpp>
#include	<boost/lexical_cast.hpp>

using namespace DbXml;
using namespace std;
using namespace boost;

typedef map<string,string> Unit;
// --------------------------------------------------------------------
extern	map <string,Unit> dict_append_proc
	(map <string,Unit> dict_aa,string id,string name,
	int population,string date_mod);
// --------------------------------------------------------------------
static map <string,Unit >  data_prepare_proc ()
{
	map <string,Unit> dict_aa;

	dict_aa = dict_append_proc (dict_aa,"t0821","山形",79526,"1922-10-17");

	dict_aa = dict_append_proc (dict_aa,"t0822","米沢",98231,"1922-12-2");
	dict_aa = dict_append_proc (dict_aa,"t0823","酒田",23429,"1922-3-28");
	dict_aa = dict_append_proc (dict_aa,"t0824","鶴岡",51486,"1922-9-21");

	dict_aa = dict_append_proc (dict_aa,"t0825","寒河江",83971,"1922-1-5");
	dict_aa = dict_append_proc (dict_aa,"t0826","天童",74948,"1922-5-22");
	dict_aa = dict_append_proc (dict_aa,"t0827","新庄",46785,"1922-7-17");
	dict_aa = dict_append_proc (dict_aa,"t0828","南陽",59614,"1922-3-04");
	dict_aa = dict_append_proc (dict_aa,"t0829","尾花沢",71823,"1922-5-9");

	return	dict_aa;
}

// --------------------------------------------------------------------
static void dict_to_dbxml_proc (map <string,Unit> dict_aa,string containerName)
{
	XmlManager mgr;

	if (mgr.existsContainer(containerName))
		{
		mgr.removeContainer(containerName);
		}

	XmlContainer cont = mgr.createContainer(containerName);

	XmlUpdateContext uc = mgr.createUpdateContext();

	map <string,Unit>:: iterator it = dict_aa.begin ();

	while (it != dict_aa.end ())
		{
		string key = (*it).first;
		Unit unit_aa = (*it).second;

		string row_aa = "<" + key + "><name>" + unit_aa["name"] \
			+ "</name><population>" + unit_aa["population"] \
			+ "</population><date_mod>" + unit_aa["date_mod"] \
			+ "</date_mod></" + key + ">";

		cont.putDocument (key,row_aa,uc);
		it++;
		}
}

// --------------------------------------------------------------------
int main(int argc, char *argv[])
{
	cerr << "*** 開始 ***\n";

	string containerName = "/var/tmp/dbxml/cities.dbxml";

	map <string,Unit> dict_aa = data_prepare_proc ();

	cout << "要素数：" << (unsigned int)dict_aa.size() << endl;

	dict_to_dbxml_proc (dict_aa,containerName);

	cerr << "*** 終了 ***\n";
	return 0;
}

// --------------------------------------------------------------------
