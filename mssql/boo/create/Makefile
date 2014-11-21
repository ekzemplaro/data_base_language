
CSHARP_COMMON=/var/www/data_base/common/csharp_common
BOO_COMMON=/var/www/data_base/common/boo_common
mssql_create.exe: mssql_create.boo
	booc mssql_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/mssql_manipulate.boo \
		-r:System.Data
clean:
	rm -f *.exe *.mdb
