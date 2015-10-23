-- ----------------------------------------------------------------
--	text_read.adb
--
--						Sep/25/2011
--
-- ----------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line;
procedure text_read is
	Input : File_Type;
	Line : String (1 .. 10_000);
	Last : Natural;
	file_text : String := Ada.Command_Line.Argument (1);
begin
	Ada.Text_IO.Put_Line("*** 開始 ***");
	Open (Input, In_File, file_text);
	while not End_Of_File (Input) loop
		Get_Line (Input,Line,Last);
		Ada.Text_IO.Put_Line (Line (1 .. Last));
	end loop;
	Close (Input);
	Ada.Text_IO.Put_Line("*** 終了 ***");
end text_read;
-- ----------------------------------------------------------------
