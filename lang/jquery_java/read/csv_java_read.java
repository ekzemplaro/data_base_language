// --------------------------------------------------------------
//	csv_java_read.java
//
//				Jun/09/2010
//
// --------------------------------------------------------------
import	java.io.PrintWriter;
import	java.io.IOException;
import	java.util.HashMap;

import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;
// --------------------------------------------------------------
public class csv_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String file_csv = "/var/tmp/csv/cities.csv";

	HashMap <String, HashMap<String,String>> dict_aa
		= text_manipulate.csv_read_proc (file_csv);

	String str_json = json_manipulate.dict_to_json_proc (dict_aa);

	out.println (str_json);
}
// --------------------------------------------------------------

}
// --------------------------------------------------------------
