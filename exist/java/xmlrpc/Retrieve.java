
/* ----------------------------------------------------------------- */
/* ----------------------------------------------------------------- */

import	java.util.Vector;
import	java.util.HashMap;
import	java.net.URL;


import	org.apache.xmlrpc.client.XmlRpcClient;
import	org.apache.xmlrpc.client.XmlRpcClientConfigImpl;

 
/* ----------------------------------------------------------------- */
public class Retrieve
{

protected final static String uri = 
    "http://localhost:8086/exist/xmlrpc";


/* ----------------------------------------------------------------- */
public static void main ( String args[] ) throws Exception
{
	XmlRpcClient client = new XmlRpcClient ();
	XmlRpcClientConfigImpl  config = new XmlRpcClientConfigImpl ();

	config.setServerURL (new URL (uri));
	config.setBasicUserName ("admin");
	config.setBasicPassword ("hello9");

	client.setConfig (config);

	HashMap options = new HashMap ();

	options.put("indent", "yes");
	options.put("encoding", "UTF-8");
	options.put("expand-xincludes", "yes");
	options.put("highlight-matches", "elements");
    
	Vector params = new Vector();
	params.addElement( args[0] ); 
	params.addElement( options );
	String xml = (String)client.execute ("getDocumentAsString", params );
    
	System.out.println( xml );
}
/* ----------------------------------------------------------------- */
}
/* ----------------------------------------------------------------- */
