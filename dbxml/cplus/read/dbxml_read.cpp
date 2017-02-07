// --------------------------------------------------------------------
/*
	dbxml_read.cpp

					Jul/31/2012

*/
// --------------------------------------------------------------------
#include <iostream>
#include <dbxml/DbXml.hpp>

using namespace DbXml;
using namespace std;

// --------------------------------------------------------------------
static void xml_parser (XmlValue value)
{
	cout << "*** " << value.asString () << endl;
}

// --------------------------------------------------------------------
static void document_parser (string containerName)
{
	XmlManager mgr;
	XmlContainer cont = mgr.openContainer(containerName);

//	string queryString = "collection('" + containerName + "')/*/population";
//	string queryString = "collection('" + containerName + "')/*/name";
	string queryString = "collection('" + containerName + "')/*";

	XmlQueryContext qc = mgr.createQueryContext ();
	XmlQueryExpression expr = mgr.prepare (queryString,qc);
	XmlResults res = expr.execute (qc);

	XmlValue value;
	std::cout << "Result: " << std::endl;
	while (res.next(value))
		{
		xml_parser (value);
		}
}

// --------------------------------------------------------------------
int main (int argc,char *argv[])
{
	cerr << "*** 開始 ***\n";

	string containerName = "cities.dbxml";
	
	try
		{
		document_parser (containerName);
		}
	catch (XmlException &xe)
		{
		std::cout << "XmlException: " << xe.what() << std::endl;
		}

	cerr << "*** 終了 ***\n";

	return 0;
}

// --------------------------------------------------------------------
