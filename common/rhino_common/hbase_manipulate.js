#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//
//	hbase_manipulate.js
//
//
//				Dec/03/2013
//
// -----------------------------------------------------------------------
importPackage(java.io);

importPackage(org.apache.hadoop.conf);
importPackage(org.apache.hadoop.fs);
importPackage(org.apache.hadoop.hbase);
importPackage(org.apache.hadoop.hbase.client);
importPackage(org.apache.hadoop.hbase.util);

importPackage(org.apache.log4j);

// -----------------------------------------------------------------------
function get_row_proc (table,key_in)
{
	var gg = new Get(Bytes.toBytes(key_in));
// if (table.exists (gg))
{
	var rr = table.get (gg);

	var bb = new Packages.java.lang.reflect.Array.newInstance(java.lang.Byte.TYPE, 0);
	var value_name = rr.getValue(Bytes.toBytes("name"),bb);
	var str_name = Bytes.toString(value_name);

	var value_population = rr.getValue(Bytes.toBytes("population"),bb);
	var str_population = Bytes.toString(value_population);

	var value_date_mod = rr.getValue(Bytes.toBytes("date_mod"),bb);
	var str_date_mod = Bytes.toString(value_date_mod);

	var out_str = key_in + "\t" + str_name + "\t" + str_population;
	out_str += "\t" + str_date_mod;

	print (out_str);
}

}

// -----------------------------------------------------------------------
function update_row_proc (table,key_in,population_in)
{
	var pp = new Put(Bytes.toBytes(key_in));

	var ss_population = "" + population_in;
	var bb = new Packages.java.lang.reflect.Array.newInstance(java.lang.Byte.TYPE, 0);
	pp.add(Bytes.toBytes("population"), bb,
      		Bytes.toBytes(ss_population));


	var today = get_current_date_proc ();
	pp.add(Bytes.toBytes("date_mod"), bb,
      		Bytes.toBytes(today));
	table.put (pp);
}

// -----------------------------------------------------------------------
function delete_row_proc (table,key_in)
{
	var dd = new Delete(Bytes.toBytes(key_in));

	table.delete (dd);
}
// -----------------------------------------------------------------------
function drop_table_proc (table_name)
{
	var tableName = Bytes.toBytes(table_name);

	var conf = HBaseConfiguration.create();
	var hAdmin = new HBaseAdmin(conf);

	var exists = hAdmin.tableExists (tableName);
	print (exists);

	if (exists)
		{
		hAdmin.disableTable (tableName);
		hAdmin.deleteTable (tableName);
		}
}

// -----------------------------------------------------------------------
function create_table_proc (table_name)
{
	var tableName = Bytes.toBytes(table_name);

	var conf = HBaseConfiguration.create();
	var hAdmin = new HBaseAdmin(conf);

	var exists = hAdmin.tableExists (tableName);
	print (exists);

	if (!exists)
		{
	var desc = new HTableDescriptor (tableName);
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("name")));
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("population")));
	desc.addFamily(new HColumnDescriptor(Bytes.toBytes("date_mod")));

	hAdmin.createTable (desc);
		}
}

// -----------------------------------------------------------------------
function insert_row_proc
	(table,key_in,name_in,population_in,date_mod_in)
{
	var pp = new Put(Bytes.toBytes(key_in));

	var bb = new Packages.java.lang.reflect.Array.newInstance(java.lang.Byte.TYPE, 0);
	pp.add (Bytes.toBytes("name"),bb,Bytes.toBytes(name_in));

	var ss_population = population_in.toString (10);

	pp.add (Bytes.toBytes("population"),bb,Bytes.toBytes(ss_population));

	pp.add (Bytes.toBytes("date_mod"),bb,Bytes.toBytes(date_mod_in));

	table.put (pp);
}

// -----------------------------------------------------------------------
function list_keys_proc (table)
{
	var ss = new Scan();

	ss.addColumn(Bytes.toBytes("name"), new byte[0]);
	var scanner = table.getScanner(ss);

	var rr = scanner.next()
	while (rr != null)
		{
		println("Found row: " + rr)
		rr = scanner.next()
		}

	scanner.close();
}
// -----------------------------------------------------------------------
