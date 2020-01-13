// -------------------------------------------------------------- 
//
//	hgdb_manipulate.java
//
//						Feb/01/2012
//
// --------------------------------------------------------------
import org.hypergraphdb.HGHandle;
import org.hypergraphdb.HGSearchResult;
import org.hypergraphdb.HyperGraph;
import org.hypergraphdb.query.AtomValueCondition;
import org.hypergraphdb.query.ComparisonOperator;
import org.hypergraphdb.query.HGQueryCondition;
import org.hypergraphdb.query.AtomTypeCondition;

import	java.util.HashMap;
import	java.io.File;
import	java.util.Set;
// --------------------------------------------------------------
public class hgdb_manipulate
{

// --------------------------------------------------------------
static HashMap <String, HashMap<String,String>> hgdb_to_dict_proc
	(String databaseLocation)
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	HyperGraph graph = null;

	try {
		graph = new HyperGraph (databaseLocation);


		HGQueryCondition condition
			= new AtomTypeCondition(HashMap.class);

		HGSearchResult<HGHandle> rs = graph.find(condition);

            try {
                while (rs.hasNext()) {
                    HGHandle current = rs.next();

		HashMap <String,String> result = graph.get(current);

		String ppx = result.get ("population");

		int population =  Integer.parseInt (ppx);

		dict_aa = text_manipulate.dict_append_proc
			(dict_aa,result.get ("id"),result.get ("name"),
			population,result.get ("date_mod"));

		}
	} finally {
		rs.close();
	}
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		if (graph != null) {
			graph.close();
		}
	}

	return	dict_aa;
}


// ------------------------------------------------------------------
public static void dict_to_hgdb_proc
	(HashMap <String, HashMap <String,String>> dict_aa,
	String databaseLocation)
{
	hgdb_clear_proc (databaseLocation);

	HyperGraph graph = null;

	try {
		graph = new HyperGraph(databaseLocation);

		Set set_aaa = dict_aa.keySet ();

		HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

		for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;
		dict_unit = dict_aa.get (key_aa);

		String str_pp = dict_unit.get("population");

		int population =  Integer.parseInt (str_pp);

		row_add_proc (graph,key,dict_unit.get("name")
			,population,dict_unit.get("date_mod"));

		}

	} catch (Exception ex)
		{
		ex.printStackTrace();
		}
	finally 
		{
		if(graph != null)
			{
			graph.close();
			}
		}
}

// ------------------------------------------------------------------
// [2]:
static void hgdb_clear_proc (String databaseLocation)
{
	File ff = new File (databaseLocation);

	File[] files=ff.listFiles();
	for(int it=0; it<files.length; it++)
		{
		files[it].delete ();
		}

	ff.delete ();
}

// ------------------------------------------------------------------
static void row_add_proc (HyperGraph graph,
	String id,String name, int population,String date_mod)
{
//	String out_str = id + "\t" + name + "\t";
//	out_str += Integer.toString (population) + "\t" + date_mod;

	HashMap <String,String> dict_unit
				= new HashMap <String,String> ();

	dict_unit.put ("id",id);
	dict_unit.put ("name",name);
	dict_unit.put ("population",Integer.toString (population));
	dict_unit.put ("date_mod",date_mod);

	graph.add (dict_unit);
//	graph.add (out_str);
//	graph.add (new String[]{id,name,Integer.toString (population),date_mod});
}

// ------------------------------------------------------------------
}
// ------------------------------------------------------------------
// --------------------------------------------------------------
