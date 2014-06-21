COMMON=/var/www/data_base/common/csharp_common
mysql_read.exe : mysql_read.cs
	dmcs mysql_read.cs \
		-r:table_manipulate.dll \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe
