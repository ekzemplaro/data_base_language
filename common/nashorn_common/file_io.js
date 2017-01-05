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
function file_to_str_proc (file_in)
{
	lines = file_read_proc (file_in)

	return lines[0]
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
