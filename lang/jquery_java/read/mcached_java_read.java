// --------------------------------------------------------------
//	mcached_java_read.java
//
//				Jun/08/2011
//
// --------------------------------------------------------------
import	java.io.IOException;
import	java.io.PrintWriter;
import	java.util.HashMap;
import	java.util.List;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;


import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;

// import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class mcached_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	mcached_disp_proc (out);

//	sample03_proc (out);
}

// --------------------------------------------------------------
static void mcached_disp_proc (PrintWriter out)
{
	String[] serverlist = { "localhost:11211" };
	SockIOPool pool = SockIOPool.getInstance();
	pool.setServers (serverlist);
	pool.initialize ();

	MemCachedClient mc = new MemCachedClient();

	String [] keys = {"t1731","t1732","t1733","t1734","t1735",
		"t1736","t1737","t1738","t1739"};

	String out_str = mcached_manipulate.mcached_to_json_proc (mc,keys);

	out.println (out_str);
}

// --------------------------------------------------------------
static void sample03_proc (PrintWriter out)
{
	HashMap <String, List>  map = new HashMap <String, List> ();

	String [] str_aa =  new String [] {"t1421","横浜","57421","2008-9-15"};
	String [] str_bb =  new String [] {"t1422","川崎","32384","2008-8-21"};
	String [] str_cc =  new String [] {"t1423","小田原","79347","2008-6-14"};
	String [] str_dd =  new String [] {"t1424","藤沢","12349","2008-5-22"};

	String [] str_ee =  new String [] {"t1425","相模原","42378","2008-7-2"};
	String [] str_ff =  new String [] {"t1426","厚木","81585","2008-11-18"};

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
