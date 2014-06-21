COMMON=/var/www/data_base/common/csharp_common
webdav_update.exe: webdav_update.boo
	booc webdav_update.boo \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
