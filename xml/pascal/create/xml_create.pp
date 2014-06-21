(* ------------------------------------------------------------------ *)
(*
	xml_create.pp

					Aug/22/2011
*)
(* ------------------------------------------------------------------ *)
program xml_create;
(* ------------------------------------------------------------------ *)
procedure	tag_out_proc (var ufile: text;tag,value: string);
begin
	write (ufile,'<');
	write (ufile,tag);
	write (ufile,'>');
	write (ufile,value);
	write (ufile,'</');
	write (ufile,tag);
	write (ufile,'>');
end;
(* ------------------------------------------------------------------ *)
procedure	out_proc (var ufile: text;id,name,population,date_mod: string);
begin
	write (ufile,'<');
	write (ufile,id);
	write (ufile,'>');
	tag_out_proc (ufile,'name',name);
	tag_out_proc (ufile,'population',population);
	tag_out_proc (ufile,'date_mod',date_mod);
	write (ufile,'</');
	write (ufile,id);
	writeln (ufile,'>');
end;
(* ------------------------------------------------------------------ *)
var	ufile: text;
	file_out: string;
begin
	writeln ('*** 開始 ***');

	file_out := ParamStr(1);
	writeln( 'file_out = ',file_out );

	assign (ufile,file_out);
	rewrite (ufile);

	writeln (ufile,'<?xml version="1.0" encoding="utf-8"?>');
	writeln (ufile,'<root>');
	out_proc (ufile,'t2261','静岡','79824','1967-4-24');
	out_proc (ufile,'t2262','浜松','52697','1967-10-21');
	out_proc (ufile,'t2263','沼津','34593','1967-5-16');
	out_proc (ufile,'t2264','三島','52492','1967-9-23');
	out_proc (ufile,'t2265','富士','41851','1967-3-9');
	out_proc (ufile,'t2266','熱海','82653','1967-5-19');
	out_proc (ufile,'t2267','富士宮','51748','1967-9-12');
	out_proc (ufile,'t2268','藤枝','94972','1967-8-18');
	out_proc (ufile,'t2269','御殿場','57564','1967-7-11');
	out_proc (ufile,'t2270','島田','52863','1967-9-18');
	writeln (ufile,'</root>');

	close (ufile);
	writeln ('*** 終了 ***');
end.

(* ------------------------------------------------------------------ *)
