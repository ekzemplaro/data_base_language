COMMON=/var/www/data_base/common/csharp_common
json_update.exe: json_update.cs
	mcs json_update.cs  \
		-r:table_manipulate.dll \
		-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
