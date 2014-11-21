CSHARP_COMMON=/var/www/data_base/common/csharp_common
postgre_delete.exe: postgre_delete.boo
	booc postgre_delete.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:Npgsql
clean:
	rm -f *.exe *.mdb
