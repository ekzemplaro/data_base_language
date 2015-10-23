// --------------------------------------------------------------
//	hsqldb_java_read.java
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
public class hsqldb_java_read extends HttpServlet 
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

	String driver = "org.hsqldb.jdbcDriver";

	Class.forName (driver).newInstance ();

	Class.forName (driver).newInstance ();

	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** Class.forName ***");
		out.println ("*** error *** hsqldb_java_read.doGet ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	hsqldb_disp_proc (out);

}

// --------------------------------------------------------------
void hsqldb_disp_proc (PrintWriter out)
{

	String str_connect="jdbc:hsqldb:file:/var/tmp/hsqldb/cities;shutdown=true";


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
			("*** error *** hsqldb_java_read.hsqldb_disp_proc ***");
		out.println ("\tstr_connect = " + str_connect);
		out.println ("*** ee *** " + ee.toString ());
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
