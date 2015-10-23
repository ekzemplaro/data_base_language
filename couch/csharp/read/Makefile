COMMON=/var/www/data_base/common/csharp_common
couch_read.exe: couch_read.cs
	mcs couch_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
