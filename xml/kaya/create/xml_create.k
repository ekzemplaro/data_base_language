// -----------------------------------------------------------------
/*
	xml_create.k

					Feb/23/2011
*/
// -----------------------------------------------------------------
program xml_create;


import System;
import IO;

// -----------------------------------------------------------------
String tag_out_proc (String tag,String value)
{
	String out_str = "\t<" + tag + ">";

	out_str += value;

	out_str += "</" + tag + ">\n";

	return	out_str;
}

// -----------------------------------------------------------------
String record_gen_proc (String id,String name,String population,String date_mod)
{
	String out_str = "<cities>\n";

	out_str += tag_out_proc ("id",id);
	out_str += tag_out_proc ("name",name);
	out_str += tag_out_proc ("population",population);
	out_str += tag_out_proc ("date_mod",date_mod);
	out_str += "</cities>\n";
	return out_str;
}

// -----------------------------------------------------------------
String data_prepare_proc ()
{
	String line = record_gen_proc ("2261","静岡","31952","1961-9-30");
	line += record_gen_proc ("2262","浜松","24941","1961-2-10");
	line += record_gen_proc ("2263","沼津","84477","1961-5-21");
	line += record_gen_proc ("2264","三島","32738","1961-5-28");
	line += record_gen_proc ("2265","富士","94581","1961-5-14");
	line += record_gen_proc ("2266","熱海","52485","1961-3-17");
	line += record_gen_proc ("2267","富士宮","29482","1961-4-15");
	line += record_gen_proc ("2268","藤枝","73454","1961-9-14");
	line += record_gen_proc ("2269","御殿場","36476","1961-8-24");
	line += record_gen_proc ("2279","島田","92417","1961-7-8");

	return line;
}

// -----------------------------------------------------------------
Void main()
{
	putStrLn("*** 開始 ***");
	putStrLn("*** start ***");

	args = getArgs ();

	file_out = args[1];

	putStrLn (file_out);

	fp_out = open (file_out,[Write]);

	put (fp_out,"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
	put (fp_out,"<root>\n");

	String line = data_prepare_proc ();

	put (fp_out, line);

	put (fp_out,"</root>\n");

	close (fp_out);

	putStrLn("*** 終了 ***");
}

// -----------------------------------------------------------------
