// --------------------------------------------------------------
//	update/post_process.java
//
//				May/26/2011
//

// --------------------------------------------------------------
import	java.io.PrintWriter;
import	java.util.Map;
import	java.util.Set;
import	java.util.Iterator;
import	javax.servlet.http.HttpServlet;
import	javax.servlet.http.HttpServletRequest;


// --------------------------------------------------------------
public class post_process extends HttpServlet 
{

// --------------------------------------------------------------
static String [][] post_process_proc
	(HttpServletRequest request,PrintWriter out)
{
	Map map_par=request.getParameterMap (); 
	Set map_ite1 = map_par.keySet (); 
	Iterator it = map_ite1.iterator ();

	out.println ("*** doPost ----------------");

	out.println ("map_par = " + map_par.toString ());

	out.println ("----------------");
	out.println (map_par.size ());
	out.println ("----------------");
	int nn = map_par.size () / 2;

	String [][] data_received = new String[nn][2];

	for (int jt=0; jt< nn; jt++)
		{
		String key_aa = "my_data[" + jt + "][id]";
		String key_bb = "my_data[" + jt + "][population]";
		String par_aa[]=(String[])map_par.get (key_aa); 
		String id_aa = par_aa[0];
		String par_bb[]=(String[])map_par.get (key_bb); 
		String population_aa = par_bb[0];
/*
		data_received[jt][0]=Integer.parseInt (id_aa);
		data_received[jt][1]=Integer.parseInt (population_aa);
*/
		data_received[jt][0]=id_aa;
		data_received[jt][1]=population_aa;
		out.println ("id = "+ data_received[jt][0] +
			"\tpopulation = " + data_received[jt][1]);
		}

	return	data_received;
}

 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
