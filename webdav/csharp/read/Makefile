COMMON=/var/www/data_base/common/csharp_common
webdav_read.exe: webdav_read.cs
	mcs webdav_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
