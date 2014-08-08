COMMON=/var/www/data_base/common/csharp_common
ftp_read.exe: ftp_read.fs
	fsharpc ftp_read.fs \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.dll
clean:
	rm -f *.exe
