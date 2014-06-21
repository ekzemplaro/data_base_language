CSHARP_COMMON=/var/www/data_base/common/csharp_common
mssql_read.exe: mssql_read.boo
	booc mssql_read.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:System.Data
clean:
	rm -f *.exe *.mdb
