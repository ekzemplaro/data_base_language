// ---------------------------------------------------------------------
//	read/riak_read.groovy
//
//					Sep/22/2015
//
// ---------------------------------------------------------------------
import groovy.json.*
import net_manipulate
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

//	def url_base = "http://host_ubuntu:8098/riak/shimane"
	def url_base = "http://cddn007-ee:8098/riak/shimane"

	def url_in = url_base + "?keys=true"

	def str_json = net_manipulate.get_uri_proc (url_in,"application/json")

	println (str_json)

	def slurper = new JsonSlurper()
	def data_aa = slurper.parseText (str_json)


	data_aa["keys"].each {
		def url_city = url_base + "/" + it
		def str_json_city = net_manipulate.get_uri_proc (url_city,"")

		if (str_json_city != null)
			{
			def slurper_city = new JsonSlurper()
			def city = slurper_city.parseText (str_json_city)

			print it + "\t"
			print city['name'] + "\t"
			print city['population'] + "\t"
			print city['date_mod'] + "\n"
			}

		}

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
