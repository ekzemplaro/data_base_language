COMMON=/var/www/data_base/common/csharp_common
couch_read.exe: couch_read.cs
	dmcs couch_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
