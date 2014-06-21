// --------------------------------------------------------------
//	update/csv_java_update.java
//
//				Jun/07/2011
//
// --------------------------------------------------------------
import	java.io.PrintWriter;
import	java.io.IOException;
import	java.util.HashMap;
import	javax.servlet.ServletException;
import	javax.servlet.http.HttpServletRequest;
import	javax.servlet.http.HttpServletResponse;
import	javax.servlet.http.HttpServlet;

// --------------------------------------------------------------
public class csv_java_update extends HttpServlet 
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
	String csv_file = "/var/tmp/csv/cities.csv";

	HashMap <String, HashMap<String,String>> dict_aa
		 = text_manipulate.csv_read_proc (csv_file);

	for (int it=0; it< data_received.length; it++)
		{
		int population = Integer.parseInt (data_received[it][1]);
		dict_aa = text_manipulate.dict_update_proc
			(dict_aa,data_received[it][0],population);
		}

	text_manipulate.csv_write_proc (csv_file,dict_aa);

	out.println ("*** update_exec *** end ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
