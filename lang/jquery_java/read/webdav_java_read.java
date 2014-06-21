// --------------------------------------------------------------
//	webdav_java_read.java
//
//				Dec/14/2010
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
// --------------------------------------------------------------
import	java.io.IOException;
import	java.io.PrintWriter;
import	javax.servlet.*;
import	javax.servlet.http.*;


import org.apache.commons.httpclient.HttpClient;  
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;

// import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class webdav_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String uri= "http://cddn007:3004/city/tokyo.json";

	String json_str = get_uri.get_uri_proc (uri);
	out.println (json_str);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
