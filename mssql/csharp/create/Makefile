COMMON=/var/www/data_base/common/csharp_common
mssql_create.exe :  mssql_create.cs
	dmcs mssql_create.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data
clean:
	rm -f *.exe
