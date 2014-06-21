COMMON=/var/www/data_base/common/csharp_common
mssql_update.exe :  mssql_update.cs
	dmcs mssql_update.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data
clean:
	rm -f *.exe
