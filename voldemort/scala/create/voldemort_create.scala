// ---------------------------------------------------------------------
//
//	voldemort_create.scala
//
//						Sep/09/2013
//
// ---------------------------------------------------------------------
import voldemort.client.ClientConfig
import voldemort.client.SocketStoreClientFactory
import voldemort.client.StoreClient
import voldemort.versioning.Versioned

import scala.collection.mutable
// ---------------------------------------------------------------------
object voldemort_create
{
// -------------------------------------------------------------------
def data_prepare_proc ():(mutable.Map[String,Object]) = {

	var dict_aa = mutable.Map[String,Object] ()

	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3051","和歌山",45178,"1998-7-24")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3052","海南",42691,"1998-2-16")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3053","橋本",32574,"1998-7-9")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3054","有田",54756,"1998-5-2")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3055","御坊",23875,"1998-9-9")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3056","田辺",18296,"1998-6-30")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3057","新宮",21578,"1998-4-22")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3058","紀の川",17689,"1998-3-17")
	dict_aa = text_manipulate.dict_append_proc (dict_aa,"t3059","岩出",43715,"1998-10-2")

	return	dict_aa
}

// ---------------------------------------------------------------------
def main( args: Array[String])
{
	println ("*** 開始 ***");

	def dict_aa = data_prepare_proc ()

	def factory = new SocketStoreClientFactory(
		new ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
	def client:StoreClient[String,String] = factory.getStoreClient ("cities")

	voldemort_manipulate.dict_to_voldemort_proc (dict_aa,client)

	println ("*** 終了 ***")
}
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
