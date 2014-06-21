#! /usr/local/bin/io
// -------------------------------------------------------
//	json_create.io
//
//					Jul/13/2012
//
// -------------------------------------------------------
record_out := method (args,
	id := args at(1);
	name := args at(2);
	population := args at(3);
	date_mod := args at(4);
	tx := args at(5);
	writeln (id .. "\t" .. name .. "\t" .. population .. "\t" .. date_mod);
	ff := args at(0)
	out_str := "\"" .. id .. "\": {"; 
	out_str := out_str .. "\"name\": \"" .. name .. "\",";
	out_str := out_str .. "\"population\":" .. population .. ",";
	out_str := out_str .. "\"date_mod\": \"" .. date_mod .. "\"}"; 
	out_str := out_str .. tx .. "\n";
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
ff write ("{" asUTF8)
record_out (list (ff,"t0921","宇都宮",46231,"1983-9-18",","))
record_out (list (ff,"t0922","小山",78216,"1983-7-5",","))
record_out (list (ff,"t0923","佐野",12789,"1983-2-8",","));
record_out (list (ff,"t0924","足利",53196,"1983-5-9",","));
record_out (list (ff,"t0925","日光",48327,"1983-9-22",","));
record_out (list (ff,"t0926","下野",69782,"1983-11-11",","));
record_out (list (ff,"t0927","さくら",42873,"1983-10-15",","));
record_out (list (ff,"t0928","矢板",45927,"1983-6-17",","));
record_out (list (ff,"t0929","真岡",43796,"1983-8-19",","));
record_out (list (ff,"t0930","栃木",74145,"1983-7-12",","));
record_out (list (ff,"t0931","大田原",54142,"1983-9-22",","));
record_out (list (ff,"t0932","鹿沼",84198,"1983-2-24",","));
record_out (list (ff,"t0933","那須塩原",27536,"1983-1-8",","));
record_out (list (ff,"t0934","那須烏山",65942,"1983-5-16","}"));

//
ff close
//
writeln ("*** 終了 ***")
// -------------------------------------------------------
