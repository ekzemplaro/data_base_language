COMMON=/var/www/data_base/common/csharp_common
mssql_delete.exe: mssql_delete.boo
	booc mssql_delete.boo \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data
clean:
	rm -f *.exe *.mdb
