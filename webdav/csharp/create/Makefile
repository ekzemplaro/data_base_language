COMMON=/var/www/data_base/common/csharp_common
webdav_create.exe: webdav_create.cs
	mcs webdav_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
