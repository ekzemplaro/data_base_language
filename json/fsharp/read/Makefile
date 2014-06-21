COMMON=/var/www/data_base/common/csharp_common
json_read.exe: json_read.fs
	fsharpc json_read.fs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
