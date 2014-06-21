COMMON=/var/www/data_base/common/csharp_common
couch_create.exe: couch_create.cs
	dmcs couch_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
