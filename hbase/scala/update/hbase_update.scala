// -----------------------------------------------------------------------
/*
	hbase_update.scala


				Jul/24/2011
*/
// -----------------------------------------------------------------------
import org.apache.hadoop.hbase.client.HTableFactory
import org.apache.hadoop.hbase.HBaseConfiguration

import org.apache.hadoop.hbase.util.Bytes

// -----------------------------------------------------------------------
object hbase_update
{

// -----------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val key = args(0)
	val population_in = Integer.parseInt (args(1))

	println (key)
	println (population_in)

	val conf = HBaseConfiguration.create()

	val factory = new HTableFactory()
	val table = factory.createHTableInterface(conf, Bytes.toBytes("cities"))
	try {
		hbase_manipulate.update_row_proc (table,key,population_in)

		} finally {
			factory.releaseHTableInterface(table)
		}

	println ("*** 終了 ***")
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
