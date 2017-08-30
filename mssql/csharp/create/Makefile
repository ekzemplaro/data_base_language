COMMON=/var/www/data_base/common/csharp_common
mssql_create.exe :  mssql_create.cs
	mcs mssql_create.cs \
		$(COMMON)/table_manipulate.cs \
		$(COMMON)/mssql_manipulate.cs \
		-r:System.Data
clean:
	rm -f *.exe
