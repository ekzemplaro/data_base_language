// --------------------------------------------------------------
//	xml_java_read.java
//
//				Jun/08/2011
//
// --------------------------------------------------------------
import	java.util.HashMap;

import	java.io.PrintWriter;
import	java.io.FileInputStream;
import	java.io.IOException;
import	javax.servlet.*;
import	javax.servlet.http.*;

import org.w3c.dom.*;
// --------------------------------------------------------------
public class xml_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String file_xml = "/var/tmp/xml_file/cities.xml";

	xml_read_proc (out,file_xml);
}

// --------------------------------------------------------------
void xml_read_proc (PrintWriter out,String file_xml)
{
	String str_xml = file_io.file_to_str_proc (file_xml);

	HashMap <String, HashMap<String,String>> dict_aa
		= xml_manipulate.xml_to_dict_proc (str_xml);


	String json_str = json_manipulate.dict_to_json_proc (dict_aa);

// out.println ("json_str = " + json_str);
// out.println ();
	out.println (json_str);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
