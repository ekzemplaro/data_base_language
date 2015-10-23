// ------------------------------------------------------------------
//
//	file_io.js
//
//						Sep/08/2010
//
// ------------------------------------------------------------------
function file_read_proc (file_in)
{
	lines_in = readFile(file_in).split("\n");  
	lines_in.pop(); // <-- last item is empty... EOF?  

//	print (lines_in.length);  

	return lines_in;
}

// ------------------------------------------------------------------
function string_read_proc (file_in)
{
	var br=BufferedReader (InputStreamReader(FileInputStream (file_in)));

	var str_in = "";

	while (line= br.readLine())
	{
		if (line==null )
		{
		break ;
		}
	str_in += line;
	}

	br.close();

	return str_in;
}

// ------------------------------------------------------------------
function file_line_write_proc (file_out,out_lines)
{
	var data_out = "";
	for (var it=0; it< out_lines.length; it++)
		{
		print (out_lines[it]);
		data_out += (out_lines[it] + "\n");
		}

	string_write_proc (file_out,data_out);
}

// ------------------------------------------------------------------
function string_write_proc (file_out,data_out)
{
	var file_pp = new File (file_out);
	var filewriter = new FileWriter (file_pp);
	var bw = new BufferedWriter (filewriter);
	var pw = new PrintWriter (bw);

	pw.print (data_out);

	bw.close ();
	pw.close ();
}

// ------------------------------------------------------------------
