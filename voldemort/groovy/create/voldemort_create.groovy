// ---------------------------------------------------------------------
//
//	voldemort_create.groovy
//
//						Sep/09/2013
//
// ---------------------------------------------------------------------
import voldemort.client.ClientConfig
import voldemort.client.SocketStoreClientFactory
import voldemort.versioning.Versioned

import	voldemort_manipulate
// ---------------------------------------------------------------------
class voldemort_create
{
// ---------------------------------------------------------------------
static data_prepare_proc ()
{
	println "*** data_prepare_proc ***"

	def dict_aa = new HashMap()
	def ff = new text_manipulate ()
	dict_aa = ff.dict_append_proc (dict_aa,"t3051","和歌山",39428,"1999-7-24")
	dict_aa = ff.dict_append_proc (dict_aa,"t3052","海南",48674,"1999-2-16")
	dict_aa = ff.dict_append_proc (dict_aa,"t3053","橋本",79832,"1999-7-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t3054","有田",59786,"1999-5-2")
	dict_aa = ff.dict_append_proc (dict_aa,"t3055","御坊",23675,"1999-9-9")
	dict_aa = ff.dict_append_proc (dict_aa,"t3056","田辺",18296,"1999-6-30")
	dict_aa = ff.dict_append_proc (dict_aa,"t3057","新宮",21578,"1999-4-22")
	dict_aa = ff.dict_append_proc (dict_aa,"t3058","紀の川",17689,"1999-3-17")
	dict_aa = ff.dict_append_proc (dict_aa,"t3059","岩出",43715,"1999-10-2")

	return	dict_aa
}

// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***");

	def dict_aa = data_prepare_proc ()


def factory = new SocketStoreClientFactory(new ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
def client = factory.getStoreClient ("cities")

	voldemort_manipulate.dict_to_voldemort_proc (dict_aa,client)


	println ("*** 終了 ***")
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
