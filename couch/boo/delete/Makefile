COMMON=/var/www/data_base/common/csharp_common
couch_delete.exe: couch_delete.boo
	booc couch_delete.boo \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe *.mdb
