COMMON=/var/www/data_base/common/csharp_common
webdav_delete.exe: webdav_delete.fs
	fsharpc webdav_delete.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
