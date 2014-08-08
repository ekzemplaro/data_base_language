// --------------------------------------------------------------------
/*
	file_io.boo

				Jul/30/2014


*/
// --------------------------------------------------------------------
namespace file_io

import	System
import	System.IO
import	System.Text


// --------------------------------------------------------------------
def file_to_str_proc (file_in as string):
	fp_in = StreamReader (file_in)


	stb = StringBuilder ()

	while ((buff = fp_in.ReadLine ()) != null):
		stb.Append (buff)

	fp_in.Close()

	str_in = stb.ToString ()

	return	str_in

// --------------------------------------------------------------------
def file_write_proc (file_name as string,str_out):
	fp_out = StreamWriter (file_name)

	fp_out.Write (str_out)

	fp_out.Close ()

// --------------------------------------------------------------------
