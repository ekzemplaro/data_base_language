// -------------------------------------------------------------- 
//
//	cassandra_manipulate.scala
//
//						Aug/01/2011
//
// -------------------------------------------------------------- 
import scala.collection.mutable

import	java.nio.ByteBuffer

import	java.util.Date
import	java.util.List
import	java.util.ArrayList
import	java.util.Map
import	java.util.HashMap

import org.apache.cassandra.utils.ByteBufferUtil

// import org.apache.cassandra.thrift._
import org.apache.thrift._
//import org.apache.cassandra.thrift.Cassandra
//import org.apache.cassandra.thrift.Column
//import org.apache.cassandra.thrift.ColumnParent
//import org.apache.cassandra.thrift.ColumnOrSuperColumn
//import org.apache.cassandra.thrift.ColumnPath
//import org.apache.cassandra.thrift.ConsistencyLevel
import org.apache.thrift.protocol.TBinaryProtocol
import org.apache.thrift.protocol.TProtocol
import org.apache.thrift.transport.TSocket
import org.apache.thrift.transport.TTransport

import org.apache.thrift.transport.TFramedTransport
// -------------------------------------------------------------- 
object cassandra_manipulate
{
// -------------------------------------------------------------- 
def cassandra_to_dict_proc (keyspace_in:String,columnFamily:String):(mutable.Map[String,Object]) =
{
	val port = new TFramedTransport(new TSocket("localhost", 9160))
	val protocol = new TBinaryProtocol(port)
	val client = new Cassandra.Client(protocol)
	port.open()
	client.set_keyspace (keyspace_in)


	var dict_aa = mutable.Map[String,Object] ()


	val nameColumn_nn = new ColumnPath(columnFamily)
	nameColumn_nn.setColumn ("name".getBytes("UTF8"))

	val nameColumn_pp = new ColumnPath(columnFamily)
	nameColumn_pp.setColumn ("population".getBytes("UTF8"))

	val nameColumn_dd = new ColumnPath(columnFamily)
	nameColumn_dd.setColumn ("date_mod".getBytes("UTF8"))

	val keys = Array ("t0531","t0532","t0533","t0534",
		"t0535","t0536","t0537","t0538","t0539")

	for (key_str <- keys)
		{

		val dict_unit = get_single_proc (client,nameColumn_nn,nameColumn_pp,nameColumn_dd,key_str)

		if (0 < dict_unit.size ())
			{
		dict_aa.put (key_str,dict_unit)
			}
		}

	port.close ()

	dict_aa
}

// -------------------------------------------------------------- 
def get_single_proc (client:Cassandra.Client,
nameColumn_nn: org.apache.cassandra.thrift.ColumnPath,
nameColumn_pp:ColumnPath,nameColumn_dd:ColumnPath,
	key_str:String):(mutable.Map[String,String]) =
{
	var dict_unit = mutable.Map[String,String] ()

	val key = ByteBuffer.wrap (key_str.getBytes("UTF-8"))

//	val col_nn = new Column ()

	val col_nn = client.get(key,nameColumn_nn,ConsistencyLevel.ONE).column

	val col_pp = client.get (key,
		nameColumn_pp,ConsistencyLevel.ONE).column

	val col_dd = client.get (key,
		nameColumn_dd,ConsistencyLevel.ONE).column

	dict_unit.put ("name",new String (col_nn.getValue (),"UTF8"))
	dict_unit.put ("population",new String (col_pp.getValue (),"UTF8"))
	dict_unit.put ("date_mod",new String (col_dd.getValue (),"UTF8"))


	dict_unit
}

// -------------------------------------------------------------- 
}
// -------------------------------------------------------------- 
