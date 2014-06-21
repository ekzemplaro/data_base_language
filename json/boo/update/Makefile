CSHARP_COMMON=/var/www/data_base/common/csharp_common
json_update.exe: json_update.boo
	booc json_update.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
