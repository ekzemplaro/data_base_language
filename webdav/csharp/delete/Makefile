COMMON=/var/www/data_base/common/csharp_common
webdav_delete.exe: webdav_delete.cs
	mcs webdav_delete.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
