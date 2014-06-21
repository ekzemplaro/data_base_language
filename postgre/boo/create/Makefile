CSHARP_COMMON=/var/www/data_base/common/csharp_common
BOO_COMMON=/var/www/data_base/common/boo_common
postgre_create.exe: postgre_create.boo
	booc postgre_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:System.Data \
		-r:Npgsql.dll
clean:
	rm -f *.exe *.mdb
