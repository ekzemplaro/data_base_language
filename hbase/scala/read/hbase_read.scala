// -----------------------------------------------------------------------
/*
	hbase_read.scala


				Jul/23/2011
*/
// -----------------------------------------------------------------------
import  java.io.IOException

import org.apache.hadoop.conf.Configuration
import org.apache.hadoop.fs.Path
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.client.Get
import org.apache.hadoop.hbase.client.HTableInterface
import org.apache.hadoop.hbase.client.Result
import org.apache.hadoop.hbase.client.HTableFactory
import org.apache.hadoop.hbase.util.Bytes


// import org.apache.log4j.PropertyConfigurator

// -----------------------------------------------------------------------
object hbase_read
{

// -----------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val keys = Array ("t1671","t1672","t1673",
			"t1674","t1675","t1676",
			"t1677","t1678","t1679")

//	PropertyConfigurator.configure("/home/uchida/dbm/hbase/hbase-0.90.3/conf/log4j.properties")

	val conf = HBaseConfiguration.create()

	val factory = new HTableFactory()
	val table = factory.createHTableInterface(conf, Bytes.toBytes("cities"))
	try {
		for (key <- keys)
		{
		hbase_manipulate.get_row_proc (table,key)
		}

		} finally {
			factory.releaseHTableInterface(table)
		}

	println ("*** 終了 ***")
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
