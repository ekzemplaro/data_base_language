// --------------------------------------------------------------------
/*
	file_io.cs

				May/18/2015


*/
// --------------------------------------------------------------------
using	System;
using	System.IO;
using	System.Text;
using	System.Collections.Generic;

// --------------------------------------------------------------------
public class	file_io
{
// --------------------------------------------------------------------
public static string file_to_str_proc (string file_in)
{
	StreamReader fp_in = new StreamReader (file_in);

	string	buff;

	StringBuilder stb = new StringBuilder ();

	while ((buff = fp_in.ReadLine ()) != null)
		{
		stb.Append (buff);
		}

	fp_in.Close();

	string	str_in = stb.ToString ();

	return	str_in;
}

// --------------------------------------------------------------------
public static void file_write_proc (string file_name,string str_out)
{
	try
		{
	StreamWriter fp_out = new StreamWriter (file_name);

	fp_out.Write (str_out);

	fp_out.Close ();
		}
	catch
		{
		Console.Error.WriteLine ("*** error *** file_write_proc ***");
		}
}

// --------------------------------------------------------------------
}

// --------------------------------------------------------------------
