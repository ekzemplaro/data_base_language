// --------------------------------------------------------------
//	mongo_java_read.java
//
//				Mar/26/2010
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
// --------------------------------------------------------------
import	java.io.*;
import	java.util.*;
import	javax.servlet.*;
import	javax.servlet.http.*;
// --------------------------------------------------------------
public class mongo_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	sample03_proc (out);

}

// --------------------------------------------------------------
// --------------------------------------------------------------
static void sample03_proc (PrintWriter out)
{
	HashMap <String, List>  map = new HashMap <String, List> ();

	String [] str_aa =  new String [] {"1421","横浜","17345","2010-03-02"};
	String [] str_bb =  new String [] {"1422","川崎","32385","2009-8-11"};
	String [] str_cc =  new String [] {"1423","小田原","39345","2009-6-14"};
	String [] str_dd =  new String [] {"1424","藤沢","12345","2009-5-22"};

	String [] str_ee =  new String [] {"1425","相模原","42345","2009-7-2"};
	String [] str_ff =  new String [] {"1426","厚木","22545","2009-7-2"};
	String str_head = "{\"cities\":[";
	String str_middle = ",";
	String str_tail = "]}";

	out.println (str_head);

	sql_to_json.unit_out_proc  (out,str_aa);
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_bb);
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_cc);
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_dd);
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_ee);
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_ff);

	out.println (str_tail);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
