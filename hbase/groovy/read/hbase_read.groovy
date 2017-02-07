// -----------------------------------------------------------------------
/*
	hbase_read.groovy


					Sep/09/2013
*/
// -----------------------------------------------------------------------
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.util.Bytes
import org.apache.hadoop.hbase.client.HTableFactory

import hbase_manipulate

// -----------------------------------------------------------------------
class hbase_read
{

// -----------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def keys = ["t1671","t1672","t1673","t1674","t1675",
		"t1676","t1677","t1678","t1679"]

	def conf = HBaseConfiguration.create ()

	def factory = new HTableFactory ()
	def table = factory.createHTableInterface (conf,Bytes.toBytes("cities"))
	try {

		for (key in keys)
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
