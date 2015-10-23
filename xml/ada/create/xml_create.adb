-- ----------------------------------------------------------------
--	xml_create.adb
--
--						Jan/05/2015
--
-- ----------------------------------------------------------------
with Ada.Text_IO;               use Ada.Text_IO; 
with Ada.Text_IO.Text_Streams;  use Ada.Text_IO.Text_Streams;
with Ada.Command_Line;
 
-- ----------------------------------------------------------------
procedure xml_create is
	procedure record_out_proc
		(Outfile : File_Type;
		key: in String;
		name: in String;
		population: in String;
		date_mod: in String) is
	begin
		Ada.Text_IO.Put_Line("*** record_out_proc ***");
		String'Write (Stream (Outfile),
			"<" & key & ">" &
			"<name>" & name & "</name>" &
			"<population>" & population & "</population>" &
			"<date_mod>" & date_mod & "</date_mod>" &
			"</" & key & ">" &
			ASCII.LF);
	end record_out_proc;

	Outfile : File_Type;
	file_text  : String := Ada.Command_Line.Argument (1);
	str_out : String := "<?xml version=" & '"' & "1.0" & '"' & " encoding=" & '"' & "utf-8" & '"' & "?>"; 
begin
	Ada.Text_IO.Put_Line("*** 開始 ***");

	Create (File => Outfile, Mode => Out_File, Name => file_text);

	String'Write (Stream (Outfile),str_out & ASCII.LF);
	String'Write (Stream (Outfile),"<root>" & ASCII.LF);

	record_out_proc (Outfile,"t2261","静岡","85746","1943-6-28");
	record_out_proc (Outfile,"t2262","浜松","62417","1943-3-15");
	record_out_proc (Outfile,"t2263","沼津","39274","1943-8-9");
	record_out_proc (Outfile,"t2264","三島","54732","1943-6-3");
	record_out_proc (Outfile,"t2265","富士","84397","1943-1-12");
	record_out_proc (Outfile,"t2266","熱海","32198","1943-2-7");
	record_out_proc (Outfile,"t2267","富士宮","54812","1943-10-21");
	record_out_proc (Outfile,"t2268","藤枝","91623","1943-5-12");
	record_out_proc (Outfile,"t2269","御殿場","47835","1943-4-24");
	record_out_proc (Outfile,"t2270","島田","83492","1943-8-12");
	String'Write (Stream (Outfile),"</root>" & ASCII.LF);
	Close (Outfile);

	Ada.Text_IO.Put_Line("*** 終了 ***");
end xml_create;
-- ----------------------------------------------------------------
