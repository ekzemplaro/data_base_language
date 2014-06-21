// ---------------------------------------------------------------------
//
//	voldemort_update.groovy
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
class voldemort_update
{
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def key=args[0]
	def population_in=args[1]

	println (key + "\t" +  population_in)

def factory = new SocketStoreClientFactory(new ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
def client = factory.getStoreClient ("cities")

	def version = client.get (key)

	if (version != null)
		{
		def json_str = version.getValue ()

		def slurper = new JsonSlurper()
		def unit_aa = slurper.parseText (json_str)
		println (unit_aa.name)

		def today = new Date ().format ("yyyy-MM-dd")
		println (today)

		def json_new = voldemort_manipulate.json_create_proc (
			unit_aa.name,population_in,today);
		println (json_new)

		client.put (key,json_new)
		}
	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
