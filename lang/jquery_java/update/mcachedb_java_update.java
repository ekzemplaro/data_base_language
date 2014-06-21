// --------------------------------------------------------------
//	update/mcachedb_java_update.java
//
//				Jun/08/2011
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

import com.danga.MemCached.SockIOPool;
import com.danga.MemCached.MemCachedClient;
// --------------------------------------------------------------
public class mcachedb_java_update extends HttpServlet 
{

// --------------------------------------------------------------
public void doPost (HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	String [][] data_received = post_process.post_process_proc (request,out);

	update_exec (out,data_received);
}

// --------------------------------------------------------------
static void update_exec (PrintWriter out,String[][] data_received)
{
	String[] serverlist = {"localhost:21201"};
	SockIOPool pool = SockIOPool.getInstance();
	pool.setServers(serverlist);
	pool.initialize();

	MemCachedClient mc = new MemCachedClient();

	for (int it=0; it< data_received.length; it++)
		{
		int population = Integer.parseInt (data_received[it][1]);
		mcached_manipulate.mcached_update_proc
			 (mc,data_received[it][0],population);
		}

	out.println ("*** mcachedb_java_update.update_exec *** end ***");
}
 
// --------------------------------------------------------------
}

// --------------------------------------------------------------
