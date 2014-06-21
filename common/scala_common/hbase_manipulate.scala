// -----------------------------------------------------------------------
/*
	hbase_manipulate.scala

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

import org.apache.log4j.PropertyConfigurator

// -----------------------------------------------------------------------
object hbase_manipulate
{

// -----------------------------------------------------------------------
def get_row_proc (table: HTableInterface,key_in: String)
{
	val gg:Get = new Get(Bytes.toBytes(key_in))
// if (table.exists (gg))
{
//	val rr = table.get (gg)
	val rr: Result = table.get (gg)

//	val bb = new byte(0)
//	val bb = new Byte(0)
	val bb = new Array[Byte](0)
//	val array_bb = Bytes.byte(0)
	val value_name = rr.getValue(Bytes.toBytes("name"),bb)
	val str_name = Bytes.toString(value_name)

	val value_population = rr.getValue(Bytes.toBytes("population"),bb)
	val str_population = Bytes.toString(value_population)

	val value_date_mod = rr.getValue(Bytes.toBytes("date_mod"),bb)
	val str_date_mod = Bytes.toString(value_date_mod)

	print (key_in + "\t")
	print (str_name + "\t")
	print (str_population + "\t")
	println (str_date_mod)
}
}

// -----------------------------------------------------------------------
def update_row_proc (table: HTableInterface,key_in:String,population_in: Int)
{
	val pp = new Put(Bytes.toBytes(key_in))

	val ss_population = "%d".format (population_in)

	val bb = new Array[Byte](0)

	pp.add(Bytes.toBytes("population"), bb, Bytes.toBytes(ss_population))

	val today = text_manipulate.get_current_date_proc ()

	pp.add(Bytes.toBytes("date_mod"), bb ,Bytes.toBytes(today))
	table.put (pp)
}

// -----------------------------------------------------------------------
def delete_row_proc (table: HTableInterface,key_in:String)
{
	val dd = new Delete(Bytes.toBytes(key_in))

	table.delete (dd)
}

// -----------------------------------------------------------------------
def drop_table_proc (table_name:String)
{
	val tableName = Bytes.toBytes(table_name)

	val conf = HBaseConfiguration.create()
	val hAdmin = new HBaseAdmin(conf)

	val exists = hAdmin.tableExists (tableName)
	println (exists)

	if (exists)
		{
		hAdmin.disableTable (tableName)
		hAdmin.deleteTable (tableName)
		}
}

// -----------------------------------------------------------------------
def create_table_proc (table_name:String)
{
	val tableName = Bytes.toBytes(table_name)

	val conf = HBaseConfiguration.create()
	val hAdmin = new HBaseAdmin(conf)

	val exists = hAdmin.tableExists (tableName)
	println (exists)

	if (!exists)
		{
	val desc = new HTableDescriptor (tableName)
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("name")))
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("population")))
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("date_mod")))

	hAdmin.createTable (desc)
		}
}

// -----------------------------------------------------------------------
def insert_row_proc
	(table:HTableInterface,key_in:String,name_in:String,
	population_in:Int,date_mod_in:String)
{
	val pp = new Put(Bytes.toBytes(key_in))

	val bb = new Array[Byte](0)

	pp.add (Bytes.toBytes("name"),bb,Bytes.toBytes(name_in))

	val ss_population = Integer.toString (population_in)

	pp.add (Bytes.toBytes("population"),bb,
      		Bytes.toBytes(ss_population))

	pp.add (Bytes.toBytes("date_mod"),bb,
      		Bytes.toBytes(date_mod_in))

	table.put (pp)
//	System.out.println ("insert_row_proc *** end")
}

// -----------------------------------------------------------------------
def list_keys_proc (table:HTableInterface)
{
	val ss = new Scan()

	val bb = new Array[Byte](0)
	ss.addColumn(Bytes.toBytes("name"), bb)

	val scanner = table.getScanner(ss)
	try {
		var rr = scanner.next()
		while (rr != null)
			{
			println("Found row: " + rr)
			rr = scanner.next()
			}
		}
	finally {
		scanner.close()
		}
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
