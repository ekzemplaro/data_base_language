COMMON=/var/www/data_base/common/csharp_common
couch_delete.exe: couch_delete.fs
	fsharpc couch_delete.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
