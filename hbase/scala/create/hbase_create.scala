// -----------------------------------------------------------------------
/*
	hbase_create.scala


					Sep/09/2013
*/
// -----------------------------------------------------------------------
import scala.collection.mutable

import org.apache.hadoop.hbase.client.HTableFactory
import org.apache.hadoop.hbase.HBaseConfiguration

import org.apache.hadoop.hbase.util.Bytes

// -----------------------------------------------------------------------
object hbase_create
{

// -----------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")


	val dict_aa = data_prepare_proc ()

	val conf = HBaseConfiguration.create()

	val factory = new HTableFactory()
	val table = factory.createHTableInterface(conf,Bytes.toBytes("cities"))

	hbase_manipulate.drop_table_proc ("cities")
	hbase_manipulate.create_table_proc ("cities")

	for (pair <- dict_aa)
		{
		val unit_aa = pair._2.asInstanceOf [mutable.Map[String,String]]
		val out_str = pair._1 + "\t" + unit_aa("name") + "\t" +
			unit_aa("population") + "\t" + unit_aa("date_mod")

		println	(out_str)

		val key = pair._1
		hbase_manipulate.insert_row_proc (table,key,unit_aa("name"),
			unit_aa("population").toInt,unit_aa("date_mod"))
		}

	factory.releaseHTableInterface(table)

	println ("*** 終了 ***")
}
// -----------------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1671","富山",41683,"1998-4-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1672","高岡",67329,"1998-8-28")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1673","魚津",86173,"1998-7-12")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1674","氷見",73542,"1998-6-23")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1675","滑川",42795,"1998-5-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1676","黒部",69274,"1998-1-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1677","砺波",31562,"1998-3-21")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1678","小矢部",75328,"1998-9-8")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t1679","南砺",27135,"1998-10-14")


	dict_aa
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
