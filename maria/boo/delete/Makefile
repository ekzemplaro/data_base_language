BOO_COMMON=/var/www/data_base/common/boo_common
maria_delete.exe: maria_delete.boo
	booc maria_delete.boo \
		$(BOO_COMMON)/mysql_manipulate.boo \
		-r:System.Data \
		-r:MySql.Data.dll
clean:
	rm -f *.exe *.mdb
