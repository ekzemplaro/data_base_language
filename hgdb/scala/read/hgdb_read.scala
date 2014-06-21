// -------------------------------------------------------------- 
//
//	hgdb_read.scala
//
//						Oct/07/2011
//
// --------------------------------------------------------------
import org.hypergraphdb._
import org.hypergraphdb.query._

import org.hypergraphdb.HGHandle
import org.hypergraphdb.HGSearchResult
import org.hypergraphdb.HyperGraph
import org.hypergraphdb.query.AtomValueCondition
import org.hypergraphdb.query.ComparisonOperator
import org.hypergraphdb.query.HGQueryCondition
import org.hypergraphdb.query.AtomTypeCondition


import	java.util.HashMap
// --------------------------------------------------------------
object hgdb_read
{

// --------------------------------------------------------------
def main (args: scala.Array[String])
{
	println ("*** 開始 ***")

	val databaseLocation = "/var/tmp/hgdb/cities_db"

	val graph = new HyperGraph(databaseLocation)

	val condition = new AtomTypeCondition ()
//	val condition = new AtomTypeCondition (HashMap.class)
//	val condition = new AtomTypeCondition (java.util.HashMap.getClass ())
//	val condition = new AtomTypeCondition (java.util.HashMap)
//	val condition = new AtomTypeCondition (java.util.HashMap.class)
//	val condition = new AtomTypeCondition (Class[HashMap])

	val rs = graph.find(condition)

	while (rs.hasNext())
		{
		val current = rs.next()
		val result:HashMap[String,Object] = graph.get(current)

		System.out.print (result.get ("id") + "\t")
//		System.out.print (result.get ("id") + "\t")
		System.out.print (result.get ("name") + "\t")
		val ppx = result.get ("population")
		System.out.print (ppx + "\t")

		System.out.println (result.get ("date_mod"))
                }

	rs.close()

	println ("*** 終了 ***")
}
// --------------------------------------------------------------
}
// --------------------------------------------------------------
