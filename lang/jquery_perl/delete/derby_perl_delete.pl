// --------------------------------------------------------------
//	update/derby_java_update.java
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
public class derby_java_update extends HttpServlet 
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
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** Class.forName ***");
		out.println ("*** error *** postgre_java_read.doGet ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	String url="jdbc:derby://localhost:1527/city_aaa;create=true";

	try
		{
		Connection conn
		= DriverManager.getConnection (url);

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
		("*** error *** postgre_java_update.update_exec ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	out.println ("*** postgre_java_update.update_exec *** end ***");
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------
