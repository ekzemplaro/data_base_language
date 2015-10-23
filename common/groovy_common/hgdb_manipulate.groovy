// -------------------------------------------------------------- 
//
//	hgdb_manipulate.groovy
//
//						Feb/01/2012
//
// --------------------------------------------------------------
import org.hypergraphdb.HGHandle
import org.hypergraphdb.HGSearchResult
import org.hypergraphdb.HyperGraph
import org.hypergraphdb.query.AtomValueCondition
import org.hypergraphdb.query.ComparisonOperator
import org.hypergraphdb.query.HGQueryCondition
import org.hypergraphdb.query.AtomTypeCondition

import	java.util.HashMap
import	java.io.File
import	java.util.Set

import	text_manipulate
// --------------------------------------------------------------
class hgdb_manipulate
{

// --------------------------------------------------------------
static hgdb_to_dict_proc (databaseLocation)
{
	def dict_aa = new HashMap ()

	HyperGraph graph = null

	try {
		graph = new HyperGraph (databaseLocation)


		def condition = new AtomTypeCondition(HashMap.class)

		HGSearchResult<HGHandle> rs = graph.find(condition)

            try {
                while (rs.hasNext()) {
                    HGHandle current = rs.next()

		HashMap <String,String> result = graph.get(current)

		String ppx = result.get ("population")

		int population =  Integer.parseInt (ppx)

		dict_aa = text_manipulate.dict_append_proc (
			dict_aa,result.get ("id"),result.get ("name"),
			population,result.get ("date_mod"))

		}
	} finally {
		rs.close()
	}
	} catch (Exception ex) {
		ex.printStackTrace()
	} finally {
		if (graph != null) {
			graph.close()
		}
	}

	return	dict_aa
}


// ------------------------------------------------------------------
static dict_to_hgdb_proc (dict_aa,databaseLocation)
{
	hgdb_clear_proc (databaseLocation)

	HyperGraph graph = null

	try {
		graph = new HyperGraph(databaseLocation)

		Set set_aaa = dict_aa.keySet ()

		def dict_unit = new HashMap <String,String> ()

		for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa
		dict_unit = dict_aa.get (key_aa)

		String str_pp = dict_unit.get("population")

		int population =  Integer.parseInt (str_pp)

		row_add_proc (graph,key,dict_unit.get("name")
			,population,dict_unit.get("date_mod"))

		}

	} catch (Exception ex)
		{
		ex.printStackTrace()
		}
	finally 
		{
		if(graph != null)
			{
			graph.close()
			}
		}
}

// ------------------------------------------------------------------
// [2]:
static hgdb_clear_proc (databaseLocation)
{
	File ff = new File (databaseLocation)

	File[] files=ff.listFiles()
//	for(int it=0 it<files.length; it++)

	files.each {
//		files[it].delete ()
		it.delete ()
		}

	ff.delete ()
}

// ------------------------------------------------------------------
static row_add_proc (graph,id,name,population,date_mod)
{

	def dict_unit = new HashMap <String,String> ()

	dict_unit.put ("id",id)
	dict_unit.put ("name",name)
	dict_unit.put ("population",Integer.toString (population))
	dict_unit.put ("date_mod",date_mod)

	graph.add (dict_unit)
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
