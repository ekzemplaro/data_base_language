COMMON=/var/www/data_base/common/csharp_common
mssql_delete.exe :  mssql_delete.cs
	mcs mssql_delete.cs \
		$(COMMON)/table_manipulate.cs \
		$(COMMON)/mssql_manipulate.cs \
		-r:System.Data
clean:
	rm -f *.exe
