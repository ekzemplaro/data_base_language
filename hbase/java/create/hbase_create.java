// -----------------------------------------------------------------------
/*
	hbase_create.java


						Nov/28/2013
*/
// -----------------------------------------------------------------------
import	java.util.HashMap;
import	java.util.Set;

import  java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTableInterface;

import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTableFactory;

import org.apache.hadoop.hbase.util.Bytes;

// -----------------------------------------------------------------------
public class hbase_create
{

// -----------------------------------------------------------------------
public static void main(String[] args) throws IOException
{
	System.out.println ("*** 開始 ***");

	HashMap <String, HashMap <String,String>>
		dict_aa = data_prepare_proc ();

	Configuration conf = HBaseConfiguration.create();
	HBaseAdmin hAdmin = new HBaseAdmin(conf);

	HTableFactory factory = new HTableFactory();
	HTableInterface table = factory.createHTableInterface
		(conf,Bytes.toBytes("cities"));


	hbase_manipulate.drop_table_proc ("cities");
	hbase_manipulate.create_table_proc ("cities");

	Set set_aaa = dict_aa.keySet ();
	System.out.println (set_aaa);

	for (Object key_aa: set_aaa)
		{
		String key = (String)key_aa;

		HashMap <String,String> dict_unit = dict_aa.get (key_aa);

		String name = dict_unit.get ("name");
		String str_pp = dict_unit.get ("population");
		int population = Integer.parseInt (str_pp);
		String date_mod = dict_unit.get ("date_mod");

		hbase_manipulate.insert_row_proc
			(table,key,name,population,date_mod);
		}

	hbase_manipulate.list_keys_proc (table);

	System.out.println ("*** 終了 ***");
}
// -----------------------------------------------------------------------
static HashMap <String, HashMap <String,String>>
data_prepare_proc ()
{
	HashMap <String, HashMap<String,String>> dict_aa
		= new HashMap <String, HashMap<String,String>> ();

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1671","富山",51274,"2008-2-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1672","高岡",47396,"2008-4-23");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1673","魚津",97153,"2008-5-24");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1674","氷見",81324,"2008-9-14");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1675","滑川",72831,"2008-8-12");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1676","黒部",28569,"2008-7-28");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1677","砺波",39457,"2008-6-19");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1678","小矢部",47369,"2008-11-15");

	dict_aa = text_manipulate.dict_append_proc
		(dict_aa,"t1679","南砺",51823,"2008-10-24");

	return	dict_aa;
}
// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
