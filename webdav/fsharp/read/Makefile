COMMON=/var/www/data_base/common/csharp_common
webdav_read.exe: webdav_read.fs
	fsharpc webdav_read.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
