// --------------------------------------------------------------
//	update/text_java_update.java
//
//				May/26/2011
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
// --------------------------------------------------------------
import	java.io.PrintWriter;
import	java.io.IOException;
import	java.util.HashMap;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;
import	javax.servlet.http.HttpServlet;


// --------------------------------------------------------------
public class text_java_update extends HttpServlet 
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
	String text_file = "/var/tmp/plain_text/cities.txt";

	HashMap <String, HashMap<String,String>> dict_aa
		 = text_manipulate.text_read_proc (text_file);

	for (int it=0; it< data_received.length; it++)
		{
		int population = Integer.parseInt (data_received[it][1]);
		dict_aa = text_manipulate.dict_update_proc
			(dict_aa,data_received[it][0],population);
		}

	text_manipulate.text_write_proc (text_file,dict_aa);

	out.println ("*** update_exec *** end ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
