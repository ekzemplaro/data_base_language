// --------------------------------------------------------------
//	h2_java_read.java
//
//				Jan/14/2011
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

import	java.sql.Connection;
import	java.sql.DriverManager;
// --------------------------------------------------------------
public class h2_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String driver = "org.h2.Driver";

	h2_disp_proc (out);
}

// --------------------------------------------------------------
void h2_disp_proc (PrintWriter out)
{

	String str_connect="jdbc:h2:file:/var/tmp/h2/cities";

	try
	{
	Connection conn = DriverManager.getConnection (str_connect,"SA","");

	sql_to_json.sql_to_json_proc (conn,out);

	conn.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
			("*** error *** h2_java_read.h2_disp_proc ***");
		out.println ("\tstr_connect = " + str_connect);
		out.println ("*** ee *** " + ee.toString ());
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
