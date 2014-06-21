// --------------------------------------------------------------
//	mcachedb_java_read.java
//
//				Jun/08/2011
//
// --------------------------------------------------------------
import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;

import	java.io.IOException;
import	java.io.PrintWriter;
import	java.util.HashMap;
import	java.util.List;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;


// import  net.arnx.jsonic.JSON;
// --------------------------------------------------------------
public class mcachedb_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	mcachedb_disp_proc (out);

//	sample05_proc (out);
}

// --------------------------------------------------------------
static void mcachedb_disp_proc (PrintWriter out)
{
	String[] serverlist = { "localhost:21201" };
	SockIOPool pool = SockIOPool.getInstance();
	pool.setServers (serverlist);
	pool.initialize ();

	MemCachedClient mc = new MemCachedClient();

	String [] keys = {"t1521","t1522","t1523","t1524","t1525","t1526",
		"t1527","t1528","t1529","t1530","t1531","t1532"};

	String out_str = mcached_manipulate.mcached_to_json_proc (mc,keys);

	out.println (out_str);
}

// --------------------------------------------------------------
static void sample05_proc (PrintWriter out)
{
	HashMap <String, List>  map = new HashMap <String, List> ();

	String [] str_aa =  new String [] {"1421","横浜","10000","2008-3-5"};
	String [] str_bb =  new String [] {"1422","川崎","20000","2008-8-11"};
	String [] str_cc =  new String [] {"1423","小田原","30000","2008-5-14"};
	String [] str_dd =  new String [] {"1424","藤沢","12349","2008-9-22"};

	String [] str_ee =  new String [] {"1425","相模原","42373","2008-7-2"};
	String [] str_ff =  new String [] {"1426","厚木","21585","2008-11-8"};
	String [] str_gg =  new String [] {"1427","横須賀","41573","2008-10-12"};
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
	out.println (str_middle);
	sql_to_json.unit_out_proc  (out,str_gg);

	out.println (str_tail);
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
