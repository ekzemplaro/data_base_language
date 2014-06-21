#! /usr/local/bin/io
// -------------------------------------------------------
//	xml_create.io
//
//					Jul/13/2012
//
// -------------------------------------------------------
record_out := method (args,
	id := args at(1);
	name := args at(2);
	population := args at(3);
	date_mod := args at(4);
	writeln (id .. "\t" .. name .. "\t" .. population .. "\t" .. date_mod);
	ff := args at(0)
	out_str := "<" .. id .. ">"; 
	out_str := out_str .. "<name>" .. name .. "</name>";
	out_str := out_str .. "<population>" .. population .. "</population>";
	out_str := out_str .. "<date_mod>" .. date_mod .. "</date_mod>";
	out_str := out_str .. "</" .. id .. ">\n"; 
	ff write (out_str asUTF8);
	)
// -------------------------------------------------------
writeln ("*** 開始 ***")
ll := System args
writeln (ll)

file_out := ll at (1)
writeln (file_out)

ff := File with (file_out)
ff remove
ff openForUpdating
ff write ("<?xml version=\"1.0\" encoding=\"utf-8\"?><root>\n" asUTF8)
record_out (list (ff,"t2261","静岡",41231,"1983-9-18"))
record_out (list (ff,"t2262","浜松",78456,"1983-7-5"))
record_out (list (ff,"t2263","沼津",15729,"1983-2-8"));
record_out (list (ff,"t2264","三島",53176,"1983-5-9"));
record_out (list (ff,"t2265","富士",45394,"1983-9-22"));
record_out (list (ff,"t2266","熱海",69782,"1983-11-11"));
record_out (list (ff,"t2267","富士宮",46873,"1983-10-15"));
record_out (list (ff,"t2268","藤枝",43927,"1983-6-17"));
record_out (list (ff,"t2269","御殿場",48796,"1983-8-19"));
record_out (list (ff,"t2270","島田",34125,"1983-7-2"));

//
ff write ("</root>\n" asUTF8)
ff close
//
writeln ("*** 終了 ***")
// -------------------------------------------------------
