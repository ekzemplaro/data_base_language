// --------------------------------------------------------------
//	update/firebird_java_update.java
//
//				Jun/20/2013
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/
// --------------------------------------------------------------
import	java.io.IOException;
import	java.io.PrintWriter;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;


import	java.sql.Connection;
import	java.sql.DriverManager;
// --------------------------------------------------------------
public class firebird_java_update extends HttpServlet 
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

	try
	{
	Class.forName("org.firebirdsql.jdbc.FBDriver");
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** Class.forName ***");
		out.println ("*** error *** postgre_java_read.doGet ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	String database = "/var/tmp/firebird/cities.fdb";
	String url="jdbc:firebirdsql:localhost/3050:" + database;

	try
		{
		Connection conn
		= DriverManager.getConnection (url,"sysdba","tiger");

		for (int it=0; it< data_received.length; it++)
			{
			int population = Integer.parseInt (data_received[it][1]);
			rdb_common.update_proc
			 (conn,data_received[it][0],population);
			}

		conn.close ();
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
		("*** error *** postgre_java_update.update_exec ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	out.println ("*** postgre_java_update.update_exec *** end ***");
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------
