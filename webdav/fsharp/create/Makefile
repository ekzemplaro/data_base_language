COMMON=/var/www/data_base/common/csharp_common
webdav_create.exe: webdav_create.fs
	fsharpc webdav_create.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
