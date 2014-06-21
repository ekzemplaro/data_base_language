// --------------------------------------------------------------
//	postgre_java_read.java
//
//					Jan/24/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/
// --------------------------------------------------------------
import	java.io.IOException;
import	java.io.PrintWriter;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;
import	javax.servlet.http.HttpServlet;

import	java.sql.Connection;
import	java.sql.DriverManager;
// --------------------------------------------------------------
public class postgre_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	postgre_disp_proc (out);
}

// --------------------------------------------------------------
void postgre_disp_proc (PrintWriter out)
{
	String url="jdbc:postgresql://localhost/city";

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
			("*** error *** postgre_java_read.postgre_disp_proc ***");
		out.println ("\turl = " + url);
		out.println ("*** ee *** " + ee.toString ());
		}
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
