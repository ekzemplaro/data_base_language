// ---------------------------------------------------------------------
/*
	java_common/sql_to_json.java

				May/10/2011


*/
// ---------------------------------------------------------------------
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.io.PrintWriter;

// ---------------------------------------------------------------------
public class sql_to_json
{

// ---------------------------------------------------------------------
static void sql_to_json_proc (Connection conn,PrintWriter out)
{
// out.println ("*** sql_to_json_proc *** start ***");

	try
		{
	Statement stmt = conn.createStatement ();

	ResultSet rset = stmt.executeQuery (
	"SELECT ID, NAME, POPULATION, DATE_MOD FROM cities order by ID");

	json_header_out_proc  (out);

	String [] unit_aa = new String [4];

	int it = 0;

	while (rset.next())
		{
		if (0 < it)
			{
			out.println (",");
			}

		unit_aa[0] = rset.getString (1);
		unit_aa[1] = rset.getString(2);
		unit_aa[2] = rset.getString(3);
		unit_aa[3] = rset.getString(4);

		
		unit_out_proc  (out,unit_aa);

		it++;
		}

	json_tail_out_proc  (out);

	rset.close();
	stmt.close();

	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		out.println ("*** error *** sql_to_json_proc ******");
		}
}

// ---------------------------------------------------------------------
static void json_header_out_proc  (PrintWriter out)
{
//	String str_head = "{\"cities\":[";
	String str_head = "{";
	out.println (str_head);
}

// ---------------------------------------------------------------------
static void json_tail_out_proc  (PrintWriter out)
{
	String str_tail = "}";
	out.println (str_tail);
}

// ---------------------------------------------------------------------
static void unit_out_proc  (PrintWriter out,String []str_unit)
{
	String out_str = "\"" + str_unit[0] + "\": {";
	out_str += "\"name\":\"" + str_unit[1];
	out_str += "\",\"population\":" + str_unit[2];
	out_str += ",\"date_mod\":\"" + str_unit[3] + "\"}";

	out.println (out_str);
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
