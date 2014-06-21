COMMON=/var/www/data_base/common/csharp_common
json_delete.exe: json_delete.cs
	dmcs json_delete.cs  \
		-r:$(COMMON)/table_manipulate.dll \
		-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
