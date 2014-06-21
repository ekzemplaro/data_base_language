COMMON=/var/www/data_base/common/csharp_common
couch_read.exe: couch_read.boo
	booc couch_read.boo \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
