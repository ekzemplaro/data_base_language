// ------------------------------------------------------------------
//	hgdb_create.scala
//
//					Jun/02/2011
// ------------------------------------------------------------------
import org.hypergraphdb.HyperGraph

import	java.io.File
import	java.util.HashMap
// ------------------------------------------------------------------
object hgdb_create
{

// ------------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val databaseLocation = "/var/tmp/hgdb/cities_db"

	val ff = new File (databaseLocation)


	def files=ff.listFiles()

	files.foreach (ffx => ffx.delete ())

	ff.delete ()


	val graph = new HyperGraph(databaseLocation)

		row_add_proc (graph,"t4171","大分",71391,"1998-2-19")
		row_add_proc (graph,"t4172","別府",28528,"1998-5-17")
		row_add_proc (graph,"t4173","中津",39287,"1998-9-12")
		row_add_proc (graph,"t4174","日田",86592,"1998-1-29")
		row_add_proc (graph,"t4175","佐伯",93571,"1998-8-8")
		row_add_proc (graph,"t4176","臼杵",32928,"1998-6-15")
		row_add_proc (graph,"t4177","津久見",58926,"1998-8-18")
		row_add_proc (graph,"t4178","竹田",86924,"1998-9-21")
		row_add_proc (graph,"t4179","豊後高田",14971,"1998-4-11")

	graph.close()

	println ("*** 終了 ***")
}

// ------------------------------------------------------------------
def row_add_proc (graph: HyperGraph,id: String,name: String,population: Int,date_mod:String)
{
	def dict_unit = new HashMap [String,String]

	dict_unit.put ("id",id)
	dict_unit.put ("name",name)
	dict_unit.put ("population",Integer.toString (population))
	dict_unit.put ("date_mod",date_mod)


	graph.add (dict_unit)
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
