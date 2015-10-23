COMMON=/var/www/data_base/common/csharp_common
json_delete.exe: json_delete.fs
	fsharpc json_delete.fs  \
		-r:table_manipulate.dll \
		-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
