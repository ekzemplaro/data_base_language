// --------------------------------------------------------------
//	derby_java_read.java
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
public class derby_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String driver = "org.apache.derby.jdbc.ClientDriver";

	derby_disp_proc (out);
}

// --------------------------------------------------------------
void derby_disp_proc (PrintWriter out)
{

	String str_connect="jdbc:derby://localhost:1527/city_aaa";


	try
	{

	Connection conn = DriverManager.getConnection (str_connect);

	sql_to_json.sql_to_json_proc (conn,out);

	conn.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
			("*** error *** derby_java_read.derby_disp_proc ***");
		out.println ("\tstr_connect = " + str_connect);
		out.println ("*** ee *** " + ee.toString ());
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
