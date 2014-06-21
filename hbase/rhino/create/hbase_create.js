#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//
//	hbase_create.js
//
//
//						Dec/04/2013
//
// -----------------------------------------------------------------------
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/hbase_manipulate.js");

// -----------------------------------------------------------------------
print ("*** 開始 ***");

var dict_aa = data_prepare_proc ();


var conf = HBaseConfiguration.create();

var factory = new HTableFactory();
var table = factory.createHTableInterface(conf, Bytes.toBytes("cities"));

drop_table_proc ("cities")
create_table_proc ("cities")

for (var key in dict_aa)
	{
	var unit_aa = dict_aa[key]
insert_row_proc (table,key,unit_aa["name"],
			Number (unit_aa["population"]),unit_aa["date_mod"])
	}


factory.releaseHTableInterface(table)

print ("*** 終了 ***");
// -----------------------------------------------------------------------
function data_prepare_proc ()
{
	var dict_aa = new Object ();

	dict_aa = dict_append_proc (dict_aa,'t1671','富山',86129,'1951-10-21');
	dict_aa = dict_append_proc (dict_aa,'t1672','高岡',43972,'1951-2-15');
	dict_aa = dict_append_proc (dict_aa,'t1673','魚津',52641,'1951-3-9');
	dict_aa = dict_append_proc (dict_aa,'t1674','氷見',38714,'1951-6-22');
	dict_aa = dict_append_proc (dict_aa,'t1675','滑川',43852,'1951-8-14');
	dict_aa = dict_append_proc (dict_aa,'t1676','黒部',61579,'1951-10-12');
	dict_aa = dict_append_proc (dict_aa,'t1677','砺波',37981,'1951-3-21');
	dict_aa = dict_append_proc (dict_aa,'t1678','小矢部',52416,'1951-7-26');
	dict_aa = dict_append_proc (dict_aa,'t1679','南砺',74857,'1951-11-8');

	return	dict_aa;
}
// -----------------------------------------------------------------------
