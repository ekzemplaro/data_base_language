// --------------------------------------------------------------
//	firebird_java_read.java
//
//					Jun/20/2013
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
import	java.sql.SQLException;
// --------------------------------------------------------------
public class firebird_java_read extends HttpServlet 
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
	DriverManager.registerDriver(new org.firebirdsql.jdbc.FBDriver());
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
		("*** error *** firebird_java_read ***");
		out.println ("*** ee *** " + ee.toString ());
		}


	firebird_disp_proc (out);
}

// --------------------------------------------------------------
void firebird_disp_proc (PrintWriter out)
{

	String user = "sysdba";
	String password = "tiger";
	String database = "/var/tmp/firebird/cities.fdb";

	String url="jdbc:firebirdsql:localhost/3050:" + database;

	try
	{
	Connection conn = DriverManager.getConnection (url,user,password);

	sql_to_json.sql_to_json_proc (conn,out);

	conn.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
			("*** error *** firebird_java_read.firebird_disp_proc ***");
		out.println ("\turl = " + url);
		out.println ("*** ee *** " + ee.toString ());
		}

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
