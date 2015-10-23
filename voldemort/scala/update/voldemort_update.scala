// ---------------------------------------------------------------------
//
//	voldemort_update.scala
//
//						Oct/06/2011
//
// ---------------------------------------------------------------------
import voldemort.client.SocketStoreClientFactory
import voldemort.client.StoreClient
import voldemort.client.ClientConfig
import voldemort.versioning.Versioned


// ---------------------------------------------------------------------
object voldemort_update
{
// ---------------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val key=args(0)
	val population_in=args(1).toInt

	println (key + "\t" +  population_in)

	val factory = new SocketStoreClientFactory(
		new ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
	val client:StoreClient[String,String] = factory.getStoreClient ("cities")

	val value = client.get (key)

	if (value != null)
		{
		val str_json = value.getValue ()

		println (str_json)

		val unit_aa = json_manipulate.json_to_unit_proc (str_json)
		println (unit_aa("name"))

		val today = text_manipulate.get_current_date_proc ()
		println (today)

		val json_new = json_manipulate.unit_json_gen_proc (
			unit_aa("name"),population_in,today);
		println (json_new)

		client.put (key,json_new)
		}
	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
