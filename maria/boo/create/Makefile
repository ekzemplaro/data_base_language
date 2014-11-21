
BOO_COMMON=/var/www/data_base/common/boo_common
maria_create.exe: maria_create.boo
	booc maria_create.boo \
		$(BOO_COMMON)/text_manipulate.boo \
		$(BOO_COMMON)/table_manipulate.boo \
		$(BOO_COMMON)/mysql_manipulate.boo \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe *.mdb
