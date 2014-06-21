// ---------------------------------------------------------------------
//
//	voldemort_delete.groovy
//
//						Jul/27/2011
//
// ---------------------------------------------------------------------
import voldemort.client.SocketStoreClientFactory
import voldemort.client.ClientConfig
import voldemort.versioning.Versioned


import text_manipulate
import voldemort_manipulate
// ---------------------------------------------------------------------
class voldemort_delete
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def key=args[0]

	println (key)

def factory = new SocketStoreClientFactory(new ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
def client = factory.getStoreClient ("cities")

	def version = client.get (key)

	if (version != null)
		{
		def str_json = version.getValue ()

		println (str_json)

		client.delete (key)
		}
	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
