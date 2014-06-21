// ---------------------------------------------------------------------
//	riak_delete.groovy
//
//					May/30/2013
//
// ---------------------------------------------------------------------
import groovy.json.*

import net_manipulate
// ---------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	def key_in=args[0]
	println (key_in)

	def url_target = "http://localhost:8098/riak/shimane/" + key_in

	def json_str = net_manipulate.rest_delete_proc (url_target)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
