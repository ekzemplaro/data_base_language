// --------------------------------------------------------------
/*
	dbxml_read.java

				Feb/22/2012

*/
// --------------------------------------------------------------
import com.sleepycat.dbxml.XmlException;
import com.sleepycat.dbxml.XmlValue;
import com.sleepycat.dbxml.XmlResults;
import com.sleepycat.dbxml.XmlQueryContext;
import com.sleepycat.dbxml.XmlQueryExpression;
import com.sleepycat.dbxml.XmlContainer;
import com.sleepycat.dbxml.XmlManager;

// -------------------
import	java.util.HashMap;

import	java.io.File;
// --------------------------------------------------------------
class dbxml_read
{
// --------------------------------------------------------------
static void document_parser (String containerName)
	throws Throwable
{
	System.out.println (containerName);
	XmlManager mgr = new XmlManager();
	XmlContainer cont = mgr.openContainer(containerName);

//	String queryString = "collection('" + containerName + "')/*/population";
//	String queryString = "collection('" + containerName + "')/*/date_mod";
	String queryString = "collection('cities.dbxml')/*";

	XmlQueryContext qc = mgr.createQueryContext ();
	XmlQueryExpression expr = mgr.prepare (queryString,qc);
	XmlResults res = expr.execute (qc);

	XmlValue value;
	while ((value = res.next()) != null)
		{
		xml_manipulate.document_parser_unit (value.asString ());
		}
}
// --------------------------------------------------------------
public static void main (String args[]) throws Throwable
{
	System.out.println ("*** 開始 ***");

		
//	String containerName = "/var/tmp/dbxml/cities.dbxml";
	String containerName = "cities.dbxml";

	try {
		document_parser (containerName);

	} catch (XmlException xe) {
	    System.err.println("XmlException during dbxml_read: " + 
			       xe.getMessage());
	    throw xe;
	}

	System.out.println ("*** 終了 ***");
}
// --------------------------------------------------------------
}

// --------------------------------------------------------------
