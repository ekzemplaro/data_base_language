COMMON=/var/www/data_base/common/csharp_common
couch_create.exe: couch_create.fs
	fsharpc couch_create.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
