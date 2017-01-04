// ------------------------------------------------------------------
//
//	file_io.js
//
//						Jan/04/2017
//
// ------------------------------------------------------------------
function file_read_proc (file_in)
{
	var Paths = Java.type('java.nio.file.Paths')
	var Files = Java.type('java.nio.file.Files')
	var typex = Java.type('java.nio.charset.StandardCharsets').UTF_8

	var lines_in = Files.readAllLines(Paths.get(file_in), typex)

	return lines_in
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
function string_write_proc (file_out,str_out)
{
        var charset = 'utf-8'

        var osw = new java.io.OutputStreamWriter(
                new java.io.FileOutputStream(file_out),charset)

        osw.write(str_out, 0, str_out.length)
        osw.close()
}

// ------------------------------------------------------------------
