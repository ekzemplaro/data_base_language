// -----------------------------------------------------------------------
/*
	hbase_delete.java


					Oct/07/2011
*/
// -----------------------------------------------------------------------
import  java.io.IOException;


import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTableFactory;
import org.apache.hadoop.hbase.util.Bytes;


// import org.apache.log4j.PropertyConfigurator;

// -----------------------------------------------------------------------
public class hbase_delete
{

// -----------------------------------------------------------------------
public static void main(String[] args) throws IOException
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
/*
	String file_property
		="/home/uchida/dbm/hbase/hbase-0.90.3/conf/log4j.properties";
	PropertyConfigurator.configure(file_property);
*/

	Configuration conf = HBaseConfiguration.create();

	HTableFactory factory = new HTableFactory();
	HTableInterface table = factory.createHTableInterface(conf, Bytes.toBytes("cities"));

	System.out.println ("\tkey = " + key);

	try {
		hbase_manipulate.delete_row_proc (table,key);
		} finally {
			factory.releaseHTableInterface(table);
		}

	System.out.println ("*** 終了 ***");
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
