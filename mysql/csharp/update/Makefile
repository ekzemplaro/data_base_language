COMMON=/var/www/data_base/common/csharp_common
mysql_update.exe : mysql_update.cs
	mcs mysql_update.cs \
		-r:table_manipulate.dll \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
