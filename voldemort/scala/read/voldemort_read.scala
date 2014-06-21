// ---------------------------------------------------------------------
//
//	voldemort_read.scala
//
//						Oct/06/2011
//
// ---------------------------------------------------------------------
import voldemort.client.StoreClient
import voldemort.client.SocketStoreClientFactory
import voldemort.client.ClientConfig
import voldemort.versioning.Versioned

// ---------------------------------------------------------------------
object voldemort_read
{
// ---------------------------------------------------------------------
def main( args: Array[String] )
{
	println ("*** 開始 ***")

	val factory = new SocketStoreClientFactory (
		new ClientConfig().setBootstrapUrls("tcp://localhost:6666"))

	val client:StoreClient[String,String] =
		factory.getStoreClient ("cities")

	println ("*** ppp ***")
	val dict_aa = voldemort_manipulate.voldemort_to_dict_proc (client)
	println ("*** qqq ***")

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
