COMMON=/var/www/data_base/common/csharp_common
webdav_delete.exe: webdav_delete.boo
	booc webdav_delete.boo \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
