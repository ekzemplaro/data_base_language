// --------------------------------------------------------------
//	update/redis_java_update.java
//
//				Apr/11/2013
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/
// --------------------------------------------------------------
import	java.io.IOException;
import	java.io.PrintWriter;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;

import	redis.clients.jedis.Jedis;

// --------------------------------------------------------------
public class redis_java_update extends HttpServlet 
{

// --------------------------------------------------------------
public void doPost (HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String [][] data_received = post_process.post_process_proc (request,out);

	try
		{
		update_exec (out,data_received);
		}
	catch (Exception ee)
		{
		ee.printStackTrace();
		}
}

// --------------------------------------------------------------
static void update_exec (PrintWriter out,String[][] data_received)
	throws Exception
{
	Jedis jedis = new Jedis("host_dbase");

	for (int it=0; it< data_received.length; it++)
		{
		int population = Integer.parseInt (data_received[it][1]);
		redis_manipulate.redis_update_proc
			 (jedis,data_received[it][0],population);
		}


	out.println ("*** mcached_java_update.update_exec *** end ***");
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------
