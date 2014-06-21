COMMON=/var/www/data_base/common/csharp_common
postgre_read.exe : postgre_read.cs
	dmcs postgre_read.cs \
		$(COMMON)/table_manipulate.cs \
		-r:System.Data \
		-r:Npgsql
clean:
	rm -f *.exe
