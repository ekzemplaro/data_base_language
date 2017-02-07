COMMON=/var/www/data_base/common/csharp_common
mysql_delete.exe : mysql_delete.cs
	mcs mysql_delete.cs \
		-r:table_manipulate.dll \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
