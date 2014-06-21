// --------------------------------------------------------------
//	xindice_java_read.java
//
//				May/17/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
import	java.util.HashMap;

import	java.io.PrintWriter;
import	java.io.IOException;
import	javax.servlet.*;
import	javax.servlet.http.*;

// --------------------------------------------------------------
public class xindice_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String server_db = "http://cdbd026:8888/xindice/db/";
	String collections = "cities";
	String url_sub = "cities";
	String url_in = server_db + collections + '/' + url_sub;

	try
	{
	String str_xml = get_uri.get_uri_proc (url_in);
	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);
	String str_json = json_manipulate.dict_to_json_proc (dict_aa);

	out.println (str_json);
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** doGet");
		out.println ("*** ee *** " + ee.toString ());
		}

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
