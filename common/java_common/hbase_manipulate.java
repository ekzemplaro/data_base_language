// -----------------------------------------------------------------------
/*
	hbase_manipulate.java


					Nov/28/2013
*/
// -----------------------------------------------------------------------
import  java.io.IOException;

import	org.apache.hadoop.conf.Configuration;

import	org.apache.hadoop.hbase.*;
// import	org.apache.hadoop.hbase.client.*;
import	org.apache.hadoop.hbase.util.*;

import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTableInterface;
// -----------------------------------------------------------------------
public class hbase_manipulate
{

// -----------------------------------------------------------------------
static void get_row_proc (HTableInterface table,String key_in)
	throws IOException
{
	Get gg = new Get(Bytes.toBytes(key_in));
// if (table.exists (gg))
{
	Result rr = table.get (gg);

	byte[] value_name = rr.getValue(Bytes.toBytes("name"),new byte[0]);
	String str_name = Bytes.toString(value_name);

	byte[] value_population = rr.getValue(Bytes.toBytes("population"),new byte[0]);
	String str_population = Bytes.toString(value_population);

	byte[] value_date_mod = rr.getValue(Bytes.toBytes("date_mod"),new byte[0]);
	String str_date_mod = Bytes.toString(value_date_mod);

	String out_str = key_in + "\t" + str_name + "\t" + str_population
			+ "\t" + str_date_mod;
	System.out.println (out_str);
}
}

// -----------------------------------------------------------------------
static void update_row_proc
	(HTableInterface table,String key_in,int population_in)
	throws IOException
{
	Put pp = new Put(Bytes.toBytes(key_in));

	String ss_population = Integer.toString (population_in);
	pp.add(Bytes.toBytes("population"), new byte[0],
      		Bytes.toBytes(ss_population));


	String today = text_manipulate.get_current_date_proc ();
	pp.add(Bytes.toBytes("date_mod"), new byte[0],
      		Bytes.toBytes(today));
	table.put (pp);
}
// -----------------------------------------------------------------------
static void delete_row_proc
	(HTableInterface table,String key_in)
	throws IOException
{
	Delete dd = new Delete (Bytes.toBytes(key_in));

	table.delete (dd);
}

// -----------------------------------------------------------------------
static void drop_table_proc (String table_name)
	throws IOException
{
	byte [] tableName = Bytes.toBytes(table_name);

	Configuration conf = HBaseConfiguration.create();
	HBaseAdmin hAdmin = new HBaseAdmin(conf);

	boolean exists = hAdmin.tableExists (tableName);
	System.out.println (exists);

	if (exists)
		{
		hAdmin.disableTable (tableName);
		hAdmin.deleteTable (tableName);
		}
}

// -----------------------------------------------------------------------
static void create_table_proc (String table_name)
	throws IOException
{
	byte [] tableName = Bytes.toBytes(table_name);

	Configuration conf = HBaseConfiguration.create();
	HBaseAdmin hAdmin = new HBaseAdmin(conf);

	boolean exists = hAdmin.tableExists (tableName);
	System.out.println (exists);

	if (!exists)
		{
	HTableDescriptor desc = new HTableDescriptor (tableName);
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("name")));
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("population")));
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("date_mod")));

	hAdmin.createTable (desc);
		}
}

// -----------------------------------------------------------------------
static void insert_row_proc
	(HTableInterface table,String key_in,String name_in,
	int population_in,String date_mod_in)
	throws IOException
{
//	System.out.println ("insert_row_proc *** start\tkey_in = " + key_in);
	Put pp = new Put(Bytes.toBytes(key_in));

	pp.add (Bytes.toBytes("name"),new byte[0],Bytes.toBytes(name_in));

	String ss_population = Integer.toString (population_in);

	pp.add (Bytes.toBytes("population"),new byte[0],
      		Bytes.toBytes(ss_population));

	pp.add (Bytes.toBytes("date_mod"),new byte[0],
      		Bytes.toBytes(date_mod_in));

	table.put (pp);
//	System.out.println ("insert_row_proc *** end");
}

// -----------------------------------------------------------------------
static void list_keys_proc (HTableInterface table)
	throws IOException
{
	Scan ss = new Scan();

	ss.addColumn(Bytes.toBytes("name"), new byte[0]);
	ResultScanner scanner = table.getScanner(ss);
	try {
		for (Result rr = scanner.next();rr != null;rr = scanner.next())
			{
			System.out.println("Found row: " + rr);
			}
		}
	finally {
		scanner.close();
		}
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
