// --------------------------------------------------------------
//	mysql_java_read.java
//
//				Jun/20/2013
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/
// --------------------------------------------------------------
import	java.io.PrintWriter;
import	java.io.IOException;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;

import	java.sql.Connection;
import	java.sql.DriverManager;
// --------------------------------------------------------------
public class mysql_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	mysql_disp_proc (out);
}

// --------------------------------------------------------------
void mysql_disp_proc (PrintWriter out)
{
	String url="jdbc:mysql://host_dbase/city";

	try
	{
	Connection conn = DriverManager.getConnection (url,"scott","tiger");

	sql_to_json.sql_to_json_proc (conn,out);

	conn.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
			("*** error *** mysql_java_read.mysql_disp_proc ***");
		out.println ("\turl = " + url);
		out.println ("*** ee *** " + ee.toString ());
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
