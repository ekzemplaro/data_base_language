COMMON=/var/www/data_base/common/csharp_common
postgre_delete.exe : postgre_delete.cs
	dmcs postgre_delete.cs \
		-r:$(COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:Npgsql
clean:
	rm -f *.exe
