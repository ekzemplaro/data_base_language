json_delete.exe: json_delete.fs
	fsharpc text_manipulate.fs file_io.fs json_manipulate.fs json_delete.fs \
		-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
