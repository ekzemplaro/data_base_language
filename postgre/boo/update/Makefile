CSHARP_COMMON=/var/www/data_base/common/csharp_common
postgre_update.exe: postgre_update.boo
	booc postgre_update.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:Npgsql.dll
clean:
	rm -f *.exe *.mdb
