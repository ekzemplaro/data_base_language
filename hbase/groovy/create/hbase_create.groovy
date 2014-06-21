// -----------------------------------------------------------------------
/*
	hbase_create.groovy


				Jul/25/2011
*/
// -----------------------------------------------------------------------
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.util.Bytes
import org.apache.hadoop.hbase.client.HTableFactory
import org.apache.hadoop.hbase.client.HBaseAdmin

import hbase_manipulate

// -----------------------------------------------------------------------
class hbase_create
{

// -----------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def dict_aa = data_prepare_proc ()

	def conf = HBaseConfiguration.create ()

	def factory = new HTableFactory ()
	def table = factory.createHTableInterface (conf,Bytes.toBytes("cities"))

HBaseAdmin hAdmin = new HBaseAdmin(conf)

	hbase_manipulate.drop_table_proc ("cities")
	hbase_manipulate.create_table_proc ("cities")

	dict_aa.keySet().each { key ->
		 print key + "\t"
		 println dict_aa[key]['name']
		hbase_manipulate.insert_row_proc (table,key,dict_aa[key]['name'],
			dict_aa[key]['population'],dict_aa[key]['date_mod'])
		 }

	hbase_manipulate.list_keys_proc (table)

	factory.releaseHTableInterface(table)
	println ("*** 終了 ***")
}

// -----------------------------------------------------------------------
static data_prepare_proc ()
{
	println "*** data_prepare_proc ***"

	def dict_aa = new HashMap()
	def ff = new text_manipulate ()

	dict_aa = ff.dict_append_proc (dict_aa,"t1671","富山",59478,"1999-7-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t1672","高岡",28674,"1999-2-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t1673","魚津",79235,"1999-11-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1674","氷見",54756,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t1675","滑川",23471,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t1676","黒部",18193,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t1677","砺波",24578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t1678","小矢部",17632,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t1679","南砺",83715,"1999-10-2")

	return	dict_aa
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
