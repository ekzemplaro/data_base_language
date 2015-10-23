COMMON=/var/www/data_base/common/csharp_common
ftp_read.exe: ftp_read.cs
	mcs ftp_read.cs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
