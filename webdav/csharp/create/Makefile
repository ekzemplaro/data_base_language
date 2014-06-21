COMMON=/var/www/data_base/common/csharp_common
webdav_create.exe: webdav_create.cs
	dmcs webdav_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
