COMMON=/var/www/data_base/common/csharp_common
ftp_create.exe: ftp_create.cs
	dmcs ftp_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
