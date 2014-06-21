// --------------------------------------------------------------
//	notyet_java_read.java
//
//				Jan/26/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
// --------------------------------------------------------------
import	java.io.IOException;
import	java.io.PrintWriter;
import	java.util.HashMap;
import	java.util.List;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;
// --------------------------------------------------------------
public class dbxml_java_read extends HttpServlet 
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
static void sample03_proc (PrintWriter out)
{
	HashMap <String, List>  map = new HashMap <String, List> ();

	String [] str_aa =  new String [] {"1421","横浜","57420","2008-9-15"};
	String [] str_bb =  new String [] {"1422","川崎","32384","2008-8-11"};
	String [] str_cc =  new String [] {"1423","小田原","39347","2008-6-14"};
	String [] str_dd =  new String [] {"1424","藤沢","12349","2008-5-22"};

	String [] str_ee =  new String [] {"1425","相模原","42373","2008-7-2"};
	String [] str_ff =  new String [] {"1426","厚木","81585","2008-11-18"};
	String [] str_gg =  new String [] {"1427","横須賀","61543","2008-7-25"};
	String [] str_hh =  new String [] {"1428","鎌倉","47537","2008-6-30"};
	String [] str_ii =  new String [] {"1429","逗子","25526","2008-5-12"};

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
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_gg);
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_hh);
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_ii);

	out.println (str_tail);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
