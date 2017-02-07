// --------------------------------------------------------------
//	update/h2_java_update.java
//
//				May/31/2011
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
public class h2_java_update extends HttpServlet 
{

// --------------------------------------------------------------
public void doPost (HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String[][] data_received = post_process.post_process_proc (request,out);

	update_exec (out,data_received);
}

// --------------------------------------------------------------
static void update_exec (PrintWriter out,String[][] data_received)
{
	try
	{
	Class.forName("org.h2.Driver");
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** Class.forName ***");
		out.println ("*** error *** h2_java_read.doGet ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	String url="jdbc:h2:";
		url += "file:/var/tmp/h2/cities";

	try
		{
		Connection conn
		= DriverManager.getConnection (url,"SA","");

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
		("*** error *** h2_java_update.update_exec ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	out.println ("*** h2_java_update.update_exec *** end ***");
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------
