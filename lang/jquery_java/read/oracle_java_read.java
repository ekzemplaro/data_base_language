// --------------------------------------------------------------
//	oracle_java_read.java
//
//				Sep/28/2010
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
import	javax.servlet.*;
import	javax.servlet.http.*;

import	java.sql.Connection;
import	java.sql.DriverManager;
// --------------------------------------------------------------
public class oracle_java_read extends HttpServlet 
{
// --------------------------------------------------------------
public void doGet
	(HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	try
	{

	Class.forName ("oracle.jdbc.driver.OracleDriver");

	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** Class.forName ***");
		out.println ("*** error *** oracle_java_read.doGet ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	oracle_disp_proc (out);

//	check_proc (out);
}

// --------------------------------------------------------------
void oracle_disp_proc (PrintWriter out)
{
	String user = "scott";
	String password = "tiger";

	String url="jdbc:oracl:thin:@spn109:1521:xe";

	try
	{


	Connection conn = DriverManager.getConnection (url,user,password);


	sql_to_json.sql_to_json_proc (conn,out);

	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
			("*** error *** oracle_java_read.oracle_disp_proc ***");
		out.println ("\turl = " + url);
		out.println ("*** ee *** " + ee.toString ());
		}

}

// --------------------------------------------------------------
static void check_proc (PrintWriter out)
{
	HashMap <String, List>  map = new HashMap <String, List> ();

	String [] str_aa =  new String [] {"21","宇都宮","12345","2009-10-12"};
	String [] str_bb =  new String [] {"22","小山","32345","2009-8-11"};
	String [] str_cc =  new String [] {"23","足利","52345","2009-6-14"};
	String [] str_dd =  new String [] {"24","佐野","62345","2009-5-22"};

	String [] str_ee =  new String [] {"25","日光","72345","2009-7-2"};
	String [] str_ff =  new String [] {"26","下野","72345","2009-7-2"};
	String str_middle = ",";

	sql_to_json.json_header_out_proc (out);

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

	sql_to_json.json_tail_out_proc (out);
}

// --------------------------------------------------------------
}
// --------------------------------------------------------------
