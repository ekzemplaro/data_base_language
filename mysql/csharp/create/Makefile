COMMON=/var/www/data_base/common/csharp_common
mysql_create.exe : mysql_create.cs
	dmcs mysql_create.cs \
		-r:System.Data \
		-r:table_manipulate.dll \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
