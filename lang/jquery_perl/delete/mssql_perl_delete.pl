// --------------------------------------------------------------
//	update/mssql_java_update.java
//
//				Mar/17/2010
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/
// --------------------------------------------------------------
import	java.io.*;
import	java.util.*;
import	javax.servlet.*;
import	javax.servlet.http.*;


import	java.sql.Connection;
import	java.sql.DriverManager;
// --------------------------------------------------------------
public class mssql_java_update extends HttpServlet 
{

// --------------------------------------------------------------
public void doPost (HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	int [][] data_received = post_process.post_process_proc (request,out);

	update_exec (out,data_received);
}

// --------------------------------------------------------------
static void update_exec (PrintWriter out,int[][] data_received)
{

	try
	{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** Class.forName ***");
		out.println ("*** error *** mssql_java_read.doGet ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	String url="jdbc:sqlserver://cdbd025\\SQLEXPRESS;";
		url += "databaseName=city;";

	try
		{
		Connection conn
		= DriverManager.getConnection (url,"sa","hello9");

		for (int it=0; it< data_received.length; it++)
			{
			rdb_common.update_proc
			 (conn,data_received[it][0],data_received[it][1]);
			}

		conn.close ();
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
		("*** error *** mssql_java_update.update_exec ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	out.println ("*** mssql_java_update.update_exec *** end ***");
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------
