// -------------------------------------------------------
//	file_io.io
//
//					Aug/28/2011
//
// -------------------------------------------------------
file_to_str_proc := method (file_in,
	str_in := File open (file_in) contents
	return  (str_in)
)

// -------------------------------------------------------
file_write_proc := method (file_name,str_out,
	writeln ("*** file_write_proc ***")
	ff := File with (file_name)
	ff remove
	ff openForUpdating
	ff write(str_out asUTF8)
	ff close
)

// -------------------------------------------------------
