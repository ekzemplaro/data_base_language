// --------------------------------------------------------------
//	update/webdav_java_update.java
//
//				Apr/10/2013
//
// --------------------------------------------------------------
import	java.io.PrintWriter;
import	java.io.IOException;
import	java.util.HashMap;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;
import	javax.servlet.http.HttpServlet;


import	net.arnx.jsonic.JSON;

// --------------------------------------------------------------
public class webdav_java_update extends HttpServlet 
{

// --------------------------------------------------------------
public void doPost (HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String [][] data_received = post_process.post_process_proc (request,out);

	update_exec (out,data_received);
}

// --------------------------------------------------------------
static void update_exec (PrintWriter out,String[][] data_received)
{
	String uri= "http://cddn007:3004/city/tokyo.json";

	String str_json = get_uri.get_uri_proc (uri);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (str_json);

	for (int it=0; it< data_received.length; it++)
		{
		int population = Integer.parseInt (data_received[it][1]);
		text_manipulate.dict_update_proc
			 (dict_aa,data_received[it][0],population);
		}

	String json_new = "";
	try
		{
		json_new = JSON.encode (dict_aa);
		}
	catch	(Exception ee)
		{
		ee.printStackTrace ();
		}

	try
		{
		get_uri.rest_put_proc (uri,json_new,"text/json");
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}


	out.println ("update_exec *** end ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
