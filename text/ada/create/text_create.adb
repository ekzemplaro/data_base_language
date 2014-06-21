-- ----------------------------------------------------------------
--	text_create.adb
--
--						Oct/10/2011
--
-- ----------------------------------------------------------------
with Ada.Text_IO;               use Ada.Text_IO; 
with Ada.Text_IO.Text_Streams;  use Ada.Text_IO.Text_Streams;
with Ada.Command_Line;
 
-- ----------------------------------------------------------------
procedure text_create is
	procedure record_out_proc
		(Outfile : File_Type;
		key: in String;
		name: in String;
		population: in String;
		date_mod: in String) is
	begin
		Ada.Text_IO.Put_Line("*** record_out_proc ***");
		String'Write (Stream (Outfile),
			key & ASCII.HT & name &ASCII.HT
			 & population & ASCII.HT & date_mod & ASCII.LF);
	end record_out_proc;

	Outfile : File_Type;
	file_text  : String := Ada.Command_Line.Argument (1);
begin
	Ada.Text_IO.Put_Line("*** 開始 ***");

	Create (File => Outfile, Mode => Out_File, Name => file_text);

	record_out_proc (Outfile,"t2381","名古屋","47325","1943-6-28");
	record_out_proc (Outfile,"t2382","豊橋","82467","1943-3-15");
	record_out_proc (Outfile,"t2383","岡崎","39254","1943-8-9");
	record_out_proc (Outfile,"t2384","一宮","54792","1943-6-3");
	record_out_proc (Outfile,"t2385","蒲郡","84327","1943-1-12");
	record_out_proc (Outfile,"t2386","常滑","32198","1943-2-7");
	record_out_proc (Outfile,"t2387","大府","54982","1943-10-21");
	record_out_proc (Outfile,"t2388","瀬戸","97623","1943-5-12");
	record_out_proc (Outfile,"t2389","犬山","47859","1943-4-24");
	Close (Outfile);

	Ada.Text_IO.Put_Line("*** 終了 ***");
end Text_create;
-- ----------------------------------------------------------------
