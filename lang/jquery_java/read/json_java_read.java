// --------------------------------------------------------------
//	json_java_read.java
//
//				May/17/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
import	java.io.FileReader;
import	java.io.BufferedReader;
import	java.io.PrintWriter;
import	java.io.IOException;

import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;
// --------------------------------------------------------------
public class json_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String file_json = "/var/tmp/json/cities.json";

	String str_json = file_io.file_to_str_proc (file_json);

	out.println (str_json);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
