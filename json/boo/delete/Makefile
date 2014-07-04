CSHARP_COMMON=/var/www/data_base/common/csharp_common
json_delete.exe: json_delete.boo
	booc json_delete.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe *.mdb
