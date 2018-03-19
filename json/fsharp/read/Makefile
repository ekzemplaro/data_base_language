COMMON=/var/www/data_base/common/csharp_common
json_read.exe: json_read.fs
	fsharpc text_manipulate.fs file_io.fs json_manipulate.fs json_read.fs \
		-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
