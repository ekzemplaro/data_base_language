COMMON=/var/www/uchida/data_base/common/csharp_common
mysql_update.exe : mysql_update.cs
	csc mysql_update.cs \
		$(COMMON)/table_manipulate.cs \
		/r:System.Data \
		/r:MySql.Data.dll
clean:
	rm -f *.exe
