// --------------------------------------------------------------
//	tcbn_java_read.java
//
//				May/16/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
import	java.io.PrintWriter;
import	java.io.IOException;
import	java.util.HashMap;
import	java.util.List;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;

import	tokyocabinet.BDB;
// --------------------------------------------------------------
public class tcbn_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	BDB bdb = new BDB();

	String file_in = "/var/tmp/tokyo_cabinet/cities.tcb";
/*
	if(!bdb.open (file_in, BDB.OWRITER | BDB.OCREAT))
		{
		int ecode = bdb.ecode();
		System.err.println("open error: " + bdb.errmsg(ecode));
		}

	try
	{
	tcbn_manipulate.tcbn_to_json_proc (bdb,out);
	}
	catch  (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** tcbn_java_read");
		out.println ("*** ee *** " + ee.toString ());
		}

	if(!bdb.close())
		{
		int ecode = bdb.ecode();
		System.err.println("close error: " + bdb.errmsg(ecode));
		}

*/
	sample03_proc (out);

}

// --------------------------------------------------------------
static void sample03_proc (PrintWriter out)
{
	String [] str_aa =  new String [] {"1421","横浜","17346","2010-03-02"};
	String [] str_bb =  new String [] {"1422","川崎","32389","2009-8-11"};
	String [] str_cc =  new String [] {"1423","小田原","39347","2009-6-14"};
	String [] str_dd =  new String [] {"1424","藤沢","12348","2009-5-22"};

	String [] str_ee =  new String [] {"1425","相模原","84347","2009-10-5"};
	String [] str_ff =  new String [] {"1426","厚木","91532","2009-11-2"};
	String str_head = "{";
	String str_middle = ",";
	String str_tail = "}";

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
