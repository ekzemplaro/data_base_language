COMMON=/var/www/data_base/common/csharp_common
ftp_read.exe: ftp_read.boo
	booc ftp_read.boo \
		-r:$(COMMON)/table_manipulate.dll \
			-r:Newtonsoft.Json.Net20.dll
clean:
	rm -f *.exe *.mdb
