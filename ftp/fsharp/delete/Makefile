COMMON=/var/www/data_base/common/csharp_common
ftp_delete.exe: ftp_delete.fs
	fsharpc ftp_delete.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe
