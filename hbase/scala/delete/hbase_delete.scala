// -----------------------------------------------------------------------
/*
	hbase_delete.scala


				Jul/24/2011
*/
// -----------------------------------------------------------------------
import org.apache.hadoop.hbase.client.HTableFactory
import org.apache.hadoop.hbase.HBaseConfiguration

import org.apache.hadoop.hbase.util.Bytes

// -----------------------------------------------------------------------
object hbase_delete
{

// -----------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val key = args(0)

	println (key)

	val conf = HBaseConfiguration.create()

	val factory = new HTableFactory()
	val table = factory.createHTableInterface(conf, Bytes.toBytes("cities"))
	try {
		hbase_manipulate.delete_row_proc (table,key)

		} finally {
			factory.releaseHTableInterface(table)
		}

	println ("*** 終了 ***")
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
