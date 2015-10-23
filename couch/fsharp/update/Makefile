COMMON=/var/www/data_base/common/csharp_common
couch_update.exe: couch_update.fs
	fsharpc couch_update.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
