// -----------------------------------------------------------------------
/*
	hbase_update.java


					Sep/09/2013
*/
// -----------------------------------------------------------------------
import  java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.hbase.client.HTableFactory;
import org.apache.hadoop.hbase.util.Bytes;

// -----------------------------------------------------------------------
public class hbase_update
{

// -----------------------------------------------------------------------
public static void main(String[] args) throws IOException
{
	System.out.println ("*** 開始 ***");

	String	key = args[0];
	int	population = Integer.parseInt (args[1]);

	Configuration conf = HBaseConfiguration.create();

	HTableFactory factory = new HTableFactory();
	HTableInterface table = factory.createHTableInterface(conf, Bytes.toBytes("cities"));

	System.out.print ("\tkey = " + key);
	System.out.println ("\tpopulation = " + population);

	try {
		hbase_manipulate.update_row_proc (table,key,population);
		} finally {
			factory.releaseHTableInterface(table);
		}

	System.out.println ("*** 終了 ***");
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
