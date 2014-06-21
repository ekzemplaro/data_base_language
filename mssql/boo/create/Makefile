
CSHARP_COMMON=/var/www/data_base/common/csharp_common
BOO_COMMON=/var/www/data_base/common/boo_common
mssql_create.exe: mssql_create.boo
	booc mssql_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		-r:$(CSHARP_COMMON)/table_manipulate.dll \
		-r:System.Data
clean:
	rm -f *.exe *.mdb
