CSHARP_COMMON=/var/www/data_base/common/csharp_common
postgre_read.exe: postgre_read.boo
	booc postgre_read.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:Npgsql.dll
clean:
	rm -f *.exe *.mdb
