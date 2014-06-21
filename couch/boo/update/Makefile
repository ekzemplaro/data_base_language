COMMON=/var/www/data_base/common/csharp_common
couch_update.exe: couch_update.boo
	booc couch_update.boo \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
