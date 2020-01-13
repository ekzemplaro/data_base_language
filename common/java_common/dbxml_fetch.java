/* ----------------------------------------------------------------- */
/*
	dbxml_fetch.java

				Mar/17/2010
*/
/* ----------------------------------------------------------------- */
import	java.net.URL;

import com.dbxml.db.client.CollectionClient;
import com.dbxml.db.client.dbXMLClient;
import com.dbxml.db.client.xmlrpc.dbXMLClientImpl;
import com.dbxml.util.dbXMLException;
 
/* ----------------------------------------------------------------- */
public class dbxml_fetch
{

/* ----------------------------------------------------------------- */
public static String dbxml_fetch_proc
	(String uri,String collections,String xml_file) throws Exception
{
	System.out.println ("dbxml_fetch uri = " + uri);

	String url_sub = collections + "/" + xml_file;

	dbXMLClient client = new dbXMLClientImpl();

	client.setProperty(dbXMLClient.USER, "scott");
	client.setProperty(dbXMLClient.PASS, "tiger");

	client.connect ();

	CollectionClient col = client.getCollection (collections);
 
	String str_out = col.getDocumentAsText (xml_file);

	client.disconnect ();

	return	str_out;	   
}
/* ----------------------------------------------------------------- */
}
/* ----------------------------------------------------------------- */
