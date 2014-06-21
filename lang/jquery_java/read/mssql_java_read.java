// --------------------------------------------------------------
//	mssql_java_read.java
//
//				Jan/24/2011
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
public class mssql_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	mssql_disp_proc (out);
}

// --------------------------------------------------------------
void mssql_disp_proc (PrintWriter out)
{

//	String url = "jdbc:sqlserver://host_mssql\\SQLEXPRESS;";
	String url = "jdbc:sqlserver://host_mssql;";
	url += "databaseName=city;";
//	url += "user=sa;password=scott_tiger;";

	String user="sa";
	String passwd="scott_tiger";

	try
	{

	Connection conn = DriverManager.getConnection (url,user,passwd);


	sql_to_json.sql_to_json_proc (conn,out);

	conn.close ();
	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
			("*** error *** mssql_java_read.mssql_disp_proc ***");
		out.println ("\turl = " + url);
		out.println ("*** ee *** " + ee.toString ());
		}

}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
