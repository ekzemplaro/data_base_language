// --------------------------------------------------------------
//	derby_java_read.java
//
//				Mar/11/2010
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
// --------------------------------------------------------------
import	java.io.*;
import	java.util.*;
import	javax.servlet.*;
import	javax.servlet.http.*;

import	java.sql.Connection;
import	java.sql.DriverManager;
// --------------------------------------------------------------
public class derby_java_read extends HttpServlet 
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

	String driver = "org.apache.derby.jdbc.ClientDriver";

	Class.forName (driver).newInstance ();

	Class.forName (driver).newInstance ();

	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** Class.forName ***");
		out.println ("*** error *** derby_java_read.doGet ***");
		out.println ("*** ee *** " + ee.toString ());
		}

	derby_disp_proc (out);

//	check_proc (out);
}

// --------------------------------------------------------------
void derby_disp_proc (PrintWriter out)
{

	String str_connect="jdbc:derby://localhost:1527/city_aaa";


	try
	{

	Connection conn = DriverManager.getConnection (str_connect);

	sql_to_json.sql_to_json_proc (conn,out);

	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println
			("*** error *** derby_java_read.derby_disp_proc ***");
		out.println ("\tstr_connect = " + str_connect);
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
