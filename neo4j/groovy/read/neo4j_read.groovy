// ---------------------------------------------------------------------
//	read/neo4j_read.groovy
//
//					Oct/11/2011
//
// ---------------------------------------------------------------------
import net_manipulate
import net.sf.json.JSONObject
// ---------------------------------------------------------------------
class neo4j_read
{
// -------------------------------------------------------------------
static void main (args)
{
	println ("*** 開始 ***")

	for ( key in 31..39)
		{
		row_parser (key)
		}

//	json_manipulate.disp_proc (json_str)

	println ("*** 終了 ***")
}

// ---------------------------------------------------------------------
static void row_parser (key)
{
	def uri= "http://localhost:7474/db/data/node/" + key + "/properties"
	def json_str = net_manipulate.get_uri_proc (uri,"application/json")
	print	json_str

	println	"length = " + json_str.length ()
	if (0 < json_str.length ())
	{
	JSONObject unit_aa = JSONObject.fromObject (json_str)

	print (unit_aa.get ("id") + "\t")
	print (unit_aa.get ("name") + "\t")
	print (unit_aa.get ("population") + "\t")
	println (unit_aa.get ("date_mod"))
	}
}

// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
