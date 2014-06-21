// --------------------------------------------------------------
//	update/json_java_update.java
//
//				May/26/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
// --------------------------------------------------------------
import	java.io.*;
import	java.util.*;
import	javax.servlet.*;
import	javax.servlet.http.*;

import	net.arnx.jsonic.JSON;
import java.text.*;

// --------------------------------------------------------------
public class json_java_update extends HttpServlet 
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
static void update_exec (PrintWriter out,String [][] data_received)
{
	String json_file = "/var/tmp/json/cities.json";

	String str_json = file_io.file_to_str_proc (json_file);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (str_json);

	for (int it=0; it< data_received.length; it++)
		{
		int population = Integer.parseInt (data_received[it][1]);
	text_manipulate.dict_update_proc (dict_aa,data_received[it][0],population);
		}

	try
		{
		JSON.encode (dict_aa,new FileWriter (json_file),true);
		}
	catch	(Exception ee)
		{
		ee.printStackTrace ();
		}


	out.println ("update_exec *** end ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
