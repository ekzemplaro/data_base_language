// -----------------------------------------------------------------------
/*
	hbase_manipulate.groovy


				Nov/28/2013
*/
// -----------------------------------------------------------------------
import  java.io.IOException

import org.apache.hadoop.conf.Configuration
import org.apache.hadoop.fs.Path
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.Get
import org.apache.hadoop.hbase.client.Put
import org.apache.hadoop.hbase.client.Delete
import org.apache.hadoop.hbase.client.HTableInterface
import org.apache.hadoop.hbase.client.Result
import org.apache.hadoop.hbase.client.HTableFactory
import org.apache.hadoop.hbase.util.Bytes
import org.apache.hadoop.hbase.client.ResultScanner
import org.apache.hadoop.hbase.client.Scan
import org.apache.hadoop.hbase.HTableDescriptor
import org.apache.hadoop.hbase.HColumnDescriptor
import org.apache.hadoop.hbase.client.HBaseAdmin

// import org.apache.log4j.PropertyConfigurator

// -----------------------------------------------------------------------
class hbase_manipulate
{

// -----------------------------------------------------------------------
static void get_row_proc (table,key_in)
{
	def gg = new Get(Bytes.toBytes(key_in))

// if (table.exists (gg))
{
	def rr = table.get (gg)

//	def value_name = rr.getValue(Bytes.toBytes("name"),new byte[0])
	def value_name = rr.getValue(Bytes.toBytes("name"),Bytes.toBytes(""))
	def str_name = Bytes.toString(value_name)

//	def value_population = rr.getValue(Bytes.toBytes("population"),new byte[0])
	def value_population = rr.getValue(Bytes.toBytes("population"),Bytes.toBytes(""))
	def str_population = Bytes.toString(value_population)

//	def value_date_mod = rr.getValue(Bytes.toBytes("date_mod"),new byte[0])
	def value_date_mod = rr.getValue(Bytes.toBytes("date_mod"),Bytes.toBytes(""))
	def str_date_mod = Bytes.toString(value_date_mod)

	print (key_in + "\t")
	print (str_name + "\t")
	print (str_population + "\t")
	println (str_date_mod)
}
}

// -----------------------------------------------------------------------
static void update_row_proc (table,key_in,population_in)
{
	def pp = new Put(Bytes.toBytes(key_in))

	def ss_population = population_in;
	pp.add(Bytes.toBytes("population"), new byte[0], Bytes.toBytes(ss_population));

	def today = new Date ().format ("yyyy-MM-dd")
	pp.add(Bytes.toBytes("date_mod"), new byte[0],Bytes.toBytes(today))

	table.put (pp)
}

// -----------------------------------------------------------------------
static void delete_row_proc (table,key_in)
{
	def dd = new Delete(Bytes.toBytes(key_in))

	table.delete (dd)
}
// -----------------------------------------------------------------------
static void drop_table_proc (table_name)
{
	def tableName = Bytes.toBytes(table_name);

	def conf = HBaseConfiguration.create();
	def hAdmin = new HBaseAdmin(conf);

	def exists = hAdmin.tableExists (tableName);
	println (exists);

	if (exists)
		{
		hAdmin.disableTable (tableName);
		hAdmin.deleteTable (tableName);
		}
}

// -----------------------------------------------------------------------
static void create_table_proc (table_name)
{
	def tableName = Bytes.toBytes(table_name);

	def conf = HBaseConfiguration.create();
	def hAdmin = new HBaseAdmin(conf);

	def exists = hAdmin.tableExists (tableName);
	println (exists);

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
static void insert_row_proc (table,key_in,name_in, population_in,date_mod_in)
{
	def pp = new Put(Bytes.toBytes(key_in));

	pp.add (Bytes.toBytes("name"),new byte[0],Bytes.toBytes(name_in));

	def ss_population = Integer.toString (population_in);

	pp.add (Bytes.toBytes("population"),new byte[0],
      		Bytes.toBytes(ss_population));

	pp.add (Bytes.toBytes("date_mod"),new byte[0],
      		Bytes.toBytes(date_mod_in));

	table.put (pp);
}

// -----------------------------------------------------------------------
static void list_keys_proc (table)
{
	def ss = new Scan();

	ss.addColumn(Bytes.toBytes("name"), new byte[0]);
	ResultScanner scanner = table.getScanner(ss);
	try {
		for (Result rr = scanner.next();rr != null;rr = scanner.next())
			{
			println("Found row: " + rr);
			}
		}
	finally {
		scanner.close();
		}
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
