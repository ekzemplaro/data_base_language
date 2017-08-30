COMMON=/var/www/data_base/common/csharp_common
mssql_update.exe :  mssql_update.cs
	mcs mssql_update.cs \
		$(COMMON)/table_manipulate.cs \
		$(COMMON)/mssql_manipulate.cs \
		-r:System.Data
clean:
	rm -f *.exe
