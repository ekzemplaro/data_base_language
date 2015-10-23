// ---------------------------------------------------------------------
//
//	voldemort_delete.scala
//
//						Oct/06/2011
//
// ---------------------------------------------------------------------
import voldemort.client.SocketStoreClientFactory
import voldemort.client.StoreClient
import voldemort.client.ClientConfig
import voldemort.versioning.Versioned


// ---------------------------------------------------------------------
object voldemort_delete
{
// ---------------------------------------------------------------------
def main (args: Array[String])
{
	println ("*** 開始 ***")

	val key=args(0)

	println (key)

	val factory = new SocketStoreClientFactory(
		new ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
	val client:StoreClient[String,String] = factory.getStoreClient ("cities")

	val value = client.get (key)

	if (value != null)
		{
		client.delete (key)
		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
