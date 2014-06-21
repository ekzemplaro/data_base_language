// --------------------------------------------------------------
//	sqlite3_java_read.java
//
//				Jul/07/2010
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
public class sqlite3_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	try
	{
	Class.forName("org.sqlite.JDBC");

	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** Class.forName ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	sqlite3_disp_proc (out);
}

// --------------------------------------------------------------
void sqlite3_disp_proc (PrintWriter out)
{
	String file_path = "/var/tmp/sqlite3/cities.db";

	String str_connect = "jdbc:sqlite:" + file_path;

	try
	{
	Connection conn = DriverManager.getConnection (str_connect);

	sql_to_json.sql_to_json_proc (conn,out);

	conn.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** sqlite3_disp_proc ***");
		out.println ("\tstr_connect = " + str_connect);
		out.println ("*** ee *** " + ee.toString ());
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
