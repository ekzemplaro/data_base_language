COMMON=/var/www/data_base/common/csharp_common
ftp_update.exe: ftp_update.cs
	dmcs ftp_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
