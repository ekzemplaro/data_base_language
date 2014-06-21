COMMON=/var/www/uchida/data_base/common/csharp_common
mssql_update.exe :  mssql_update.cs
	gmcs mssql_update.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data
clean:
	rm -f *.exe
