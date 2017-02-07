// --------------------------------------------------------------
//	update/xml_java_update.java
//
//				May/26/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/
// --------------------------------------------------------------
import	java.io.PrintWriter;
import	java.io.IOException;
import	java.util.HashMap;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;

import java.util.Date;

// --------------------------------------------------------------
public class xml_java_update extends HttpServlet 
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
	String xml_file = "/var/tmp/xml_file/cities.xml";

	out.println ("update_exec xml_file = " + xml_file);

	String str_xml = "";
	try
		{
		str_xml = file_io.file_to_str_proc (xml_file);
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** update_exec ***");
		out.println ("*** ee *** " + ee.toString ());
		}

HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);

	out.println ("data_received.length = " + data_received.length);

	for (int it=0; it< data_received.length; it++)
		{
		int population = Integer.parseInt (data_received[it][1]);
		text_manipulate.dict_update_proc (dict_aa,data_received[it][0],population);

		}

	try
		{
	String xml_str_new = xml_manipulate.dict_to_xml_proc (dict_aa);

	file_io.file_write_proc (xml_file,xml_str_new);
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** update_exec ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	out.println ("update_exec *** end ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
