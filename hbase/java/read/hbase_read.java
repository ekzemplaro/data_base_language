// -----------------------------------------------------------------------
/*
	hbase_read.java


					Dec/04/2013
*/
// -----------------------------------------------------------------------
import	java.io.IOException;

import	org.apache.hadoop.conf.Configuration;
import	org.apache.hadoop.hbase.HBaseConfiguration;

import	org.apache.hadoop.hbase.client.HTableInterface;
import	org.apache.hadoop.hbase.client.HTableFactory;
import	org.apache.hadoop.hbase.client.Scan;
import	org.apache.hadoop.hbase.client.ResultScanner;
import	org.apache.hadoop.hbase.client.Result;

import	org.apache.hadoop.hbase.util.Bytes;

// -----------------------------------------------------------------------
public class hbase_read
{

// -----------------------------------------------------------------------
public static void main(String[] args) throws IOException
{
	System.out.println ("*** 開始 ***");

	Configuration conf = HBaseConfiguration.create ();

	HTableFactory factory = new HTableFactory ();
	HTableInterface table = factory.createHTableInterface
			(conf, Bytes.toBytes("cities"));
	try {
		Scan ss = new Scan ();
		ss.addColumn (Bytes.toBytes("name"),new byte[0]);
		ss.addColumn (Bytes.toBytes("population"),new byte[0]);
		ss.addColumn (Bytes.toBytes("date_mod"),new byte[0]);

		ResultScanner rs = table.getScanner (ss);

		for (Result rr : rs)
		{
		String key = Bytes.toString (rr.getRow());
		hbase_manipulate.get_row_proc (table,key);
		}
		} finally {
			factory.releaseHTableInterface(table);
		}

	System.out.println ("*** 終了 ***");
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
