// --------------------------------------------------------------
/*
	dbxml_create.java

				Feb/21/2012

*/
// --------------------------------------------------------------
import com.sleepycat.dbxml.XmlException;
import com.sleepycat.dbxml.XmlManager;
import com.sleepycat.dbxml.XmlContainer;
import com.sleepycat.dbxml.XmlDocument;
import com.sleepycat.dbxml.XmlUpdateContext;

/* */
import com.sleepycat.dbxml.XmlResults;
import com.sleepycat.dbxml.XmlValue;
import com.sleepycat.dbxml.XmlQueryContext;
import com.sleepycat.dbxml.XmlQueryExpression;

import	java.io.File;
import	java.util.HashMap;
import	java.util.Set;
// --------------------------------------------------------------
class dbxml_create
{
// --------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0821","山形",51276,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0822","米沢",43842,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0823","酒田",98253,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0824","鶴岡",87624,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0825","寒河江",72531,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0826","天童",28529,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0827","新庄",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0828","南陽",47362,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t0829","尾花沢",56872,"2008-10-24");

	return	dict_aa;
}
// --------------------------------------------------------------
static void document_parser (String containerName)
	throws Throwable
{
	System.out.println (containerName);
	XmlManager mgr = new XmlManager();
	XmlContainer cont = mgr.openContainer(containerName);

	String queryString = "collection('cities.dbxml')/*/name";
//	String queryString = "collection('cities.dbxml')/*/population";
//	String queryString = "collection('" + containerName + "')/*/population";
//	String queryString = "collection('cities.dbxml')/*";

	XmlQueryContext qc = mgr.createQueryContext ();
	XmlQueryExpression expr = mgr.prepare (queryString,qc);
	XmlResults res = expr.execute (qc);

	XmlValue value;
	while ((value = res.next()) != null)
		{
		System.out.println ("aaa");
		System.out.println (value.asString());
		}
}

// --------------------------------------------------------------
static void dict_to_dbxml_proc
	(HashMap <String, HashMap <String,String>> dict_aa,
	String containerName)
	throws Throwable
{
	HashMap <String,String> dict_unit
				= new HashMap <String,String> ();


//	File fileA = new File(containerName);
//	fileA.delete();

	XmlManager mgr = new XmlManager();

	if (mgr.existsContainer(containerName) != 0)
		{
		mgr.removeContainer(containerName);
		}

	XmlContainer cont = mgr.createContainer(containerName);

	Set set_aaa = dict_aa.keySet ();

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		System.out.println (key);
		dict_unit = dict_aa.get (key_aa);

		String row_aa = "<" + key + "><name>" + dict_unit.get ("name")
			+ "</name><population>" + dict_unit.get ("population")
			+ "</population><date_mod>" + dict_unit.get ("date_mod")
			+ "</date_mod></" + key + ">";

		cont.putDocument (key, row_aa);
		}

}

// --------------------------------------------------------------
public static void main (String args[]) throws Throwable 
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();
	
	System.out.println (dict_aa.size ());

//	String containerName = "/var/tmp/dbxml/cities.dbxml";
	String containerName = "cities.dbxml";

	dict_to_dbxml_proc (dict_aa,containerName);

	containerName = "cities.dbxml";
//	document_parser (containerName);

	System.out.println ("*** 終了 ***");
}

// --------------------------------------------------------------

}

// --------------------------------------------------------------
