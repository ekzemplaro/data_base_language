// -------------------------------------------------------------- 
//
//	java_common/cassandra_manipulate.java
//
//						Jul/26/2011
//
// -------------------------------------------------------------- 
import	java.nio.ByteBuffer;

import	java.util.Date;
import	java.util.List;
import	java.util.ArrayList;
import	java.util.Map;
import	java.util.HashMap;

import org.apache.cassandra.utils.ByteBufferUtil;

import org.apache.cassandra.thrift.Cassandra;
import org.apache.cassandra.thrift.Column;
import org.apache.cassandra.thrift.ColumnParent;
import org.apache.cassandra.thrift.ColumnOrSuperColumn;
import org.apache.cassandra.thrift.ColumnPath;
import org.apache.cassandra.thrift.ConsistencyLevel;

import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;

import org.apache.thrift.transport.TFramedTransport;
// -------------------------------------------------------------- 
public class cassandra_manipulate
{
// -------------------------------------------------------------- 
static HashMap <String,HashMap<String,String>> cassandra_to_dict_proc
	(String keyspace_in,String columnFamily) throws Exception
{
	TTransport port = new TFramedTransport(new TSocket("localhost", 9160));
	TProtocol protocol = new TBinaryProtocol(port);
	Cassandra.Client client = new Cassandra.Client(protocol);
	port.open();
	client.set_keyspace (keyspace_in);


	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();


	ColumnPath nameColumn_nn = new ColumnPath(columnFamily);
	nameColumn_nn.setColumn ("name".getBytes("UTF8"));

	ColumnPath nameColumn_pp = new ColumnPath(columnFamily);
	nameColumn_pp.setColumn ("population".getBytes("UTF8"));

	ColumnPath nameColumn_dd = new ColumnPath(columnFamily);
	nameColumn_dd.setColumn ("date_mod".getBytes("UTF8"));

	String keys[] = {"t0531","t0532","t0533","t0534",
		"t0535","t0536","t0537","t0538","t0539"};

	for (String key_str : keys)
		{

		HashMap <String,String> dict_unit = get_single_proc
		(client,nameColumn_nn,nameColumn_pp,nameColumn_dd,key_str);

		if (0 < dict_unit.size ())
			{
		dict_aa.put (key_str,dict_unit);
			}
		}

	port.close ();

	return	dict_aa;
}

// -------------------------------------------------------------- 
static HashMap <String,String> get_single_proc (Cassandra.Client client,
    ColumnPath nameColumn_nn,ColumnPath nameColumn_pp,ColumnPath nameColumn_dd,
	String key_str)
throws Exception
{
	HashMap <String,String> dict_unit = new HashMap <String,String> ();

	final ByteBuffer key = ByteBuffer.wrap (key_str.getBytes("UTF-8"));

	Column col_nn = new Column ();
try
	{
	col_nn = client.get(key,nameColumn_nn,ConsistencyLevel.ONE).column;

	Column col_pp = client.get (key,
		nameColumn_pp,ConsistencyLevel.ONE).column;

	Column col_dd = client.get (key,
		nameColumn_dd,ConsistencyLevel.ONE).column;

	dict_unit.put ("name",new String (col_nn.getValue (),"UTF8"));
	dict_unit.put ("population",new String (col_pp.getValue (),"UTF8"));
	dict_unit.put ("date_mod",new String (col_dd.getValue (),"UTF8"));


	}
	catch (Exception ee)
	{
//	ee.printStackTrace ();
	System.out.println ("*** get_single_proc not found ***\t" + key_str);
	}


	return	dict_unit;
}

// -------------------------------------------------------------- 
static void cassandra_update_proc
	(String keyspace_in,String cfamily,String key,int population_in)
	throws Exception
{

	TTransport port = new TFramedTransport(new TSocket("localhost", 9160));
	TProtocol protocol = new TBinaryProtocol(port);
	Cassandra.Client client = new Cassandra.Client(protocol);
	port.open();
	client.set_keyspace (keyspace_in);


	System.out.print ("*** cassandra_update_proc ***\t" + key);
	System.out.println ("\t" + population_in);

String str_pp = Integer.toString (population_in);




ColumnParent parent = new ColumnParent (cfamily);
ByteBuffer rowid = ByteBuffer.wrap (key.getBytes ());
Column column = new Column ();
column.setName ("population".getBytes ());
column.setValue (str_pp.getBytes ());
column.setTimestamp (System.currentTimeMillis());

//	client.insert(rowid, parent, column, ConsistencyLevel.ONE);
	client.insert(rowid, parent, column, ConsistencyLevel.ALL);


	String	str_ddx = text_manipulate.get_current_date_proc ();

	port.flush ();
	port.close ();
}

// -------------------------------------------------------------- 
static void cassandra_delete_proc
	(Cassandra.Client client,String columnFamily,int id_in)
	throws Exception
{
	System.out.println ("*** delete_proc ***\t" + id_in);

	String key_str = Integer.toString (id_in);

	ColumnPath nameColumn_path = new ColumnPath(columnFamily);

client.remove (ByteBufferUtil.bytes(key_str), nameColumn_path,
                System.currentTimeMillis(), ConsistencyLevel.ALL);

/*        nameColumn_pp.setColumn ("population".getBytes("UTF8"));

client.insert(keyspace, key, nameColumn_pp, str_pp.getBytes("UTF8"),
                System.currentTimeMillis(), ConsistencyLevel.ONE);

	ColumnPath nameColumn_qq = new ColumnPath(columnFamily);
        nameColumn_qq.setColumn ("date_mod".getBytes("UTF8"));

	String	str_ddx = text_manipulate.get_current_date_proc ();

client.insert(keyspace, key, nameColumn_qq, str_ddx.getBytes("UTF8"),
                System.currentTimeMillis(), ConsistencyLevel.ONE);

*/

}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
