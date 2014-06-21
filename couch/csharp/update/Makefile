COMMON=/var/www/data_base/common/csharp_common
couch_update.exe: couch_update.cs
	dmcs couch_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
