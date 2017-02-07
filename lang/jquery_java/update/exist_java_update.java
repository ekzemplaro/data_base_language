// --------------------------------------------------------------
//	update/exist_java_update.java
//
//				Jun/07/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/
// --------------------------------------------------------------
import	java.io.IOException;
import	java.io.PrintWriter;
import	java.util.HashMap;

import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;
import	javax.servlet.http.HttpServlet;

// --------------------------------------------------------------
public class exist_java_update extends HttpServlet 
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
	final String uri = "http://admin:hello9@cpt003:8086/exist/rest/db";

	String collections = "cities";
	String xml_file = "cities.xml";

	String uri_aa = uri + "/" + collections + "/" + xml_file;

	String str_xml = "";

	try
	{
	str_xml = get_uri.get_uri_proc (uri_aa);
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** ee *** " + ee.toString ());
		}

	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);

	try
		{
		for (int it=0; it< data_received.length; it++)
			{
			int population = Integer.parseInt (data_received[it][1]);
			text_manipulate.dict_update_proc
			 (dict_aa,data_received[it][0],population);
			}
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** ee *** " + ee.toString ());
		}


	try
	{
	String str_out_aa = xml_manipulate.dict_to_xml_proc (dict_aa);
	get_uri.rest_put_proc (uri_aa,str_out_aa,"text/xml");
	}
	catch (Exception ee)
	{
	ee.printStackTrace ();
	}


	out.println ("*** exist_java_update.update_exec *** end ***");
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------
