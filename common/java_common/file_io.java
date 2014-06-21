// -----------------------------------------------------------------------
/*
	file_io.java

					May/16/2011
*/
// -----------------------------------------------------------------------
import	java.io.File;
import	java.io.FileReader;
import	java.io.FileWriter;
import	java.io.BufferedReader;
import	java.io.BufferedWriter;
import	java.io.PrintWriter;

// -----------------------------------------------------------------------
public class file_io
{

// -----------------------------------------------------------------------
static String file_to_str_proc (String file_in)
{
	String str_in = "";
	try
		{
		FileReader in_file = new FileReader (file_in);

		BufferedReader	buff = new BufferedReader (in_file);

		String	line;

		while ((line = buff.readLine ()) != null)
			{
			str_in += line;
			}
		}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}

	return	str_in;
}

// ----------------------------------------------------------------
static void file_write_proc (String file_out,String str_out)
{
	try
	{
	File file = new File (file_out);
	FileWriter filewriter = new FileWriter (file);
	BufferedWriter bw = new BufferedWriter (filewriter);

	PrintWriter pw = new PrintWriter (bw);
	pw.println (str_out);
	pw.close ();

	}
	catch (Exception ee)
		{
		ee.printStackTrace ();
		}

}

// -----------------------------------------------------------------------
}
// -----------------------------------------------------------------------
