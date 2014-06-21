// ---------------------------------------------------------------------
//
//	voldemort_read.groovy
//
//						Sep/09/2013
//
// ---------------------------------------------------------------------
import voldemort.client.SocketStoreClientFactory
import voldemort.client.ClientConfig
import voldemort.versioning.Versioned

import groovy.json.*

import text_manipulate
import voldemort_manipulate
// ---------------------------------------------------------------------
class voldemort_read
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def factory = new SocketStoreClientFactory \
		(new ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
	def client = factory.getStoreClient ("cities")

	def dict_aa = voldemort_manipulate.voldemort_to_dict_proc (client)

	text_manipulate.dict_display_proc (dict_aa)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
