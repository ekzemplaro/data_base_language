// --------------------------------------------------------------
//	ftp_java_read.java
//
//				Aug/21/2011
//
// --------------------------------------------------------------
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;


import	java.io.IOException;
import	java.io.PrintWriter;
import	javax.servlet.*;
import	javax.servlet.http.*;


// --------------------------------------------------------------
public class ftp_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String hostname = "host_dbase";
	String user = "scott";
	String passwd = "tiger";
	String path_file = "city/iwate.json";

	String json_str = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file);

	out.println (json_str);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
