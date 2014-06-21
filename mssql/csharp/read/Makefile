COMMON=/var/www/data_base/common/csharp_common
mssql_read.exe :  mssql_read.cs
	dmcs mssql_read.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data
clean:
	rm -f *.exe
