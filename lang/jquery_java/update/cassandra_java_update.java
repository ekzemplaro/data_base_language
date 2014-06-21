// --------------------------------------------------------------
//	update/cassandra_java_update.java
//
//				Sep/01/2010
//
/*
	String data=request.getParameter ("nmax");
	int	nmax = Integer.parseInt (data);
*/

// --------------------------------------------------------------
// --------------------------------------------------------------
import	java.io.*;
import	java.util.*;
import	java.text.*;
import	javax.servlet.*;
import	javax.servlet.http.*;


import org.apache.cassandra.thrift.Cassandra;
import org.apache.cassandra.thrift.Column;
import org.apache.cassandra.thrift.ColumnOrSuperColumn;
import org.apache.cassandra.thrift.ColumnPath;
import org.apache.cassandra.thrift.ConsistencyLevel;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;

// --------------------------------------------------------------
public class cassandra_java_update extends HttpServlet 
{

// --------------------------------------------------------------
public void doPost (HttpServletRequest request,HttpServletResponse response)
		throws IOException,ServletException
{
	response.setContentType ("text/json; charset=UTF-8");

	PrintWriter out=response.getWriter ();

	int [][] data_received = post_process.post_process_proc (request,out);

	try
		{
		update_exec (out,data_received);
		}
	catch	(Exception ee)
		{
		ee.printStackTrace ();
		}

}

// --------------------------------------------------------------
static void update_exec
	(PrintWriter out,int[][] data_received) throws Exception
{
	TTransport port = new TSocket("cdbd026", 9160);
//	TTransport port = new TSocket("localhost", 9160);

	TProtocol protocol = new TBinaryProtocol(port);
	Cassandra.Client client = new Cassandra.Client(protocol);
	port.open();

	String keyspace = "Keyspace1";
	String columnFamily = "Standard2";

	for (int it=0; it< data_received.length; it++)
		{
		cassandra_manipulate.cassandra_update_proc
		(client,columnFamily,keyspace,data_received[it][0],data_received[it][1]);

		}


	port.close();


	out.println ("update_exec *** end ***");
}
 
// --------------------------------------------------------------
}
// --------------------------------------------------------------
