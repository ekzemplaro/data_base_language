// --------------------------------------------------------------
//	redis_java_read.java
//
//					Apr/11/2013
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
import	java.io.IOException;
import	java.io.PrintWriter;
import	java.util.HashMap;
import	java.util.List;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;

import redis.clients.jedis.Jedis;
// --------------------------------------------------------------
public class redis_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	redis_disp_proc (out);

//	sample03_proc (out);
}

// --------------------------------------------------------------
static void redis_disp_proc (PrintWriter out)
{
	Jedis jedis = new Jedis("host_dbase");

	try
	{
	String str_json = redis_manipulate.redis_to_json_proc (jedis);

	out.println (str_json);
	}
	catch  (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** redis_disp_proc");
		out.println ("*** ee *** " + ee.toString ());
		}

}

// --------------------------------------------------------------
static void unit_out_proc  (PrintWriter out,String []str_unit)
{
	String out_str = "\"" + str_unit[0] + "\": {";
	out_str += "\"name\":\"" + str_unit[1];
	out_str += "\",\"population\":" + str_unit[2];
	out_str += ",\"date_mod\":\"" + str_unit[3] + "\"}";

	out.println (out_str);
}
// --------------------------------------------------------------
static void sample03_proc (PrintWriter out)
{
	HashMap <String, List>  map = new HashMap <String, List> ();

	String [] str_aa =  new String [] {"t0421","仙台","57400","2008-9-15"};
	String [] str_bb =  new String [] {"t0422","石巻","32300","2008-8-21"};
	String [] str_cc =  new String [] {"t0423","塩竈","39300","2008-6-14"};
	String [] str_dd =  new String [] {"t0424","気仙沼","12349","2008-5-22"};

	String [] str_ee =  new String [] {"t0425","白石","42378","2008-7-2"};
	String [] str_ff =  new String [] {"t0426","名取","81585","2008-11-18"};
	String [] str_gg =  new String [] {"t0427","多賀城","61543","2008-7-25"};
	String [] str_hh =  new String [] {"t0428","岩沼","47537","2008-6-30"};
	String [] str_ii =  new String [] {"t0429","大崎","25726","2008-9-12"};

	String str_head = "{";
	String str_middle = ",";
	String str_tail = "}";

	out.println (str_head);

	unit_out_proc  (out,str_aa);
	out.println (str_middle);
	unit_out_proc  (out,str_bb);
	out.println (str_middle);
	unit_out_proc  (out,str_cc);
	out.println (str_middle);
	unit_out_proc  (out,str_dd);
	out.println (str_middle);
	unit_out_proc  (out,str_ee);
	out.println (str_middle);
	unit_out_proc  (out,str_ff);
	out.println (str_middle);
	unit_out_proc  (out,str_gg);
	out.println (str_middle);
	unit_out_proc  (out,str_hh);
	out.println (str_middle);
	unit_out_proc  (out,str_ii);

	out.println (str_tail);
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
