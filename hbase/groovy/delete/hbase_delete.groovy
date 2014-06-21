// -----------------------------------------------------------------------
/*
	hbase_delete.groovy


				Jul/24/2011
*/
// -----------------------------------------------------------------------
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.util.Bytes
import org.apache.hadoop.hbase.client.HTableFactory

import hbase_manipulate

// -----------------------------------------------------------------------
class hbase_delete
{

// -----------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")
	def key=args[0]

	def conf = HBaseConfiguration.create ()

	def factory = new HTableFactory ()
	def table = factory.createHTableInterface (conf,Bytes.toBytes("cities"))

	println (key)
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
