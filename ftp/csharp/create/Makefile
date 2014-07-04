COMMON=/var/www/data_base/common/csharp_common
ftp_create.exe: ftp_create.cs
	mcs ftp_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
