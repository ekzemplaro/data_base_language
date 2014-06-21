// --------------------------------------------------------------
//	update/ftp_java_update.java
//
//				Apr/10/2013
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
public class ftp_java_update extends HttpServlet 
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
	String hostname = "cddn007";
	String user = "scott";
	String passwd = "tiger";
	String path_file = "city/iwate.json";

	String str_json = ftp_manipulate.ftp_get_proc (hostname,user,passwd,path_file);

	HashMap <String, HashMap<String,String>> dict_aa
			= json_manipulate.json_to_dict_proc (str_json);

	for (int it=0; it< data_received.length; it++)
		{
		int population = Integer.parseInt (data_received[it][1]);
		text_manipulate.dict_update_proc
			 (dict_aa,data_received[it][0],population);
		}

	String json_new = json_manipulate.dict_to_json_proc (dict_aa);


	try
		{
		ftp_manipulate.ftp_put_proc (hostname,user,passwd,path_file,json_new);


		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}


	out.println ("update_exec *** end ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
